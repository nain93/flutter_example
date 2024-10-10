import 'package:flutter/material.dart';
import 'package:flutter_example/screens/home/widgets/home_stadium_list.dart';
import 'package:flutter_example/screens/home/widgets/recommend_list.dart';
import 'package:flutter_example/utils/router_config.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends StatefulHookConsumerWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context
            .push('${GoRoutes.home.fullPath}${GoRoutes.createRoom.fullPath}'),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).dividerColor,
                    width: 1,
                  ),
                ),
              ),
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Theme.of(context).disabledColor,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                isScrollable: true,
                dividerHeight: 0,
                controller: _tabController,
                indicator: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                tabAlignment: TabAlignment.start,
                tabs: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text('추천 직관'),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text('홈구장별 직관'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  RecommendList(),
                  HomeStadiumList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
