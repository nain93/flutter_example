import 'package:flutter/material.dart';
import 'package:flutter_example/constants/constants.dart';
import 'package:flutter_example/utils/router_config.dart';
import 'package:flutter_example/widgets/match_card.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeStadiumList extends StatefulHookConsumerWidget {
  const HomeStadiumList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeStadiumListState();
}

class _HomeStadiumListState extends ConsumerState<HomeStadiumList>
    with SingleTickerProviderStateMixin {
  var selectedStadium = Constants.stadiumList[0];
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: Constants.stadiumList.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainer.withOpacity(0.5),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            isScrollable: true,
            controller: _tabController,
            physics: const ClampingScrollPhysics(),
            splashBorderRadius: BorderRadius.circular(5),
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            dividerHeight: 0,
            tabAlignment: TabAlignment.start,
            indicatorPadding: const EdgeInsets.all(0),
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
          // Row(
          //   children: [
          //     Button(
          //       height: 32,
          //       text: selectedStadium,
          //       onPressed: () {
          //         BottomSheetUtils.showRoundedBottomSheet(
          //           context,
          //           padding: const EdgeInsets.symmetric(vertical: 20),
          //           SizedBox(
          //             height: 500,
          //             child: Column(
          //               children: [
          //                 Text(
          //                   '구장 선택',
          //                   style: Theme.of(context).textTheme.titleMedium,
          //                 ),
          //                 Expanded(
          //                   child: ListView.builder(
          //                     physics: const ClampingScrollPhysics(),
          //                     itemCount: Constants.stadiumList.length,
          //                     itemBuilder: (context, index) {
          //                       var stadium = Constants.stadiumList[index];
          //                       return ListTile(
          //                         contentPadding:
          //                             const EdgeInsets.symmetric(horizontal: 20),
          //                         trailing: selectedStadium == stadium
          //                             ? const Icon(Icons.check)
          //                             : null,
          //                         title: Text(stadium),
          //                         onTap: () {
          //                           setState(() {
          //                             selectedStadium = stadium;
          //                           });
          //                           context.pop();
          //                         },
          //                       );
          //                     },
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         );
          //       },
          //     ),
          //     const Gap(5),
          //     Text(
          //       '직관',
          //       style: Theme.of(context).textTheme.titleMedium,
          //     ),
          //   ],
          // ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              itemCount: 1,
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    context.push(
                      GoRoutes.matchDetail.fullPath,
                    );
                  },
                  child: const SizedBox(),
                  // child: const MatchCard(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
