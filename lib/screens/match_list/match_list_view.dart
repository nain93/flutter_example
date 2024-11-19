import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/constants/constants.dart';
import 'package:flutter_example/screens/match_list/match_list_view_model.dart';
import 'package:flutter_example/utils/router_config.dart';
import 'package:flutter_example/utils/utils.dart';
import 'package:flutter_example/widgets/custom_error_widget.dart';
import 'package:flutter_example/widgets/loading_indicator.dart';
import 'package:flutter_example/widgets/match_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';

final today = DateTime.now();

class MatchListView extends HookConsumerWidget {
  const MatchListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(matchListViewModelProvider);
    var notifier = ref.read(matchListViewModelProvider.notifier);
    var tabController =
        useTabController(initialLength: Constants.stadiumList.length);

    debugPrint(
        'viewModel.value?.selectedDate:${viewModel.value?.selectedDate}');

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              isScrollable: true,
              controller: tabController,
              physics: const ClampingScrollPhysics(),
              splashBorderRadius: BorderRadius.circular(5),
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              dividerHeight: 0,
              tabAlignment: TabAlignment.start,
              labelPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
              tabs: Constants.stadiumList.map(
                (element) {
                  return Tab(
                    text: element,
                    height: 30,
                  );
                },
              ).toList(),
            ),
            CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.single,
                firstDate: today,
              ),
              value: [viewModel.value?.selectedDate],
              onValueChanged: (dates) {
                notifier.setSelectedDate(dates.first);
              },
            ),
            Expanded(
              child: Container(
                color: Theme.of(context)
                    .colorScheme
                    .surfaceContainer
                    .withOpacity(0.5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: viewModel.when(
                  data: (data) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${Utils.dateStringFormat(date: data.selectedDate)} 경기 모임',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const Gap(20),
                        Expanded(
                          child: data.matchList.isEmpty
                              ? const Center(
                                  child: Text('경기가 없습니다.'),
                                )
                              : ListView.builder(
                                  itemCount: data.matchList.length,
                                  itemBuilder: (context, index) {
                                    var match = data.matchList[index];
                                    return InkWell(
                                      borderRadius: BorderRadius.circular(10),
                                      onTap: () {
                                        context.push(
                                          GoRoutes.matchDetail.fullPath,
                                        );
                                      },
                                      child: MatchCard(
                                        match: match,
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ],
                    );
                  },
                  error: (error, stackTrace) => CustomErrorWidget(error: error),
                  loading: () => const LoadingIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
