import 'package:flutter/material.dart';
import 'package:flutter_example/screens/match_list/match_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MatchListView extends StatefulHookConsumerWidget {
  const MatchListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MatchListViewState();
}

class _MatchListViewState extends ConsumerState<MatchListView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              controller: tabController,
              dividerColor: Theme.of(context).colorScheme.surface,
              // labelPadding:
              //     const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: const EdgeInsets.all(0),
              indicatorSize: TabBarIndicatorSize.tab,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: const [
                Tab(
                  child: Text("전체"),
                ),
                Tab(
                  child: Text("tab2"),
                ),
                Tab(
                  child: Text("tab3"),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      children: List.generate(
                        20,
                        (index) => const MatchTile(),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        10,
                        (index) => ListTile(
                          title: Text("item $index"),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        10,
                        (index) => ListTile(
                          title: Text("item $index"),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
