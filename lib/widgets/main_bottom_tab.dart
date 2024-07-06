import 'package:flutter/material.dart';
import 'package:flutter_example/utils/router_config.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainBottomTab extends StatefulHookConsumerWidget {
  const MainBottomTab({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainBottomTabState();
}

class BottomNavigationListType {
  const BottomNavigationListType({
    required this.text,
    required this.icon,
  });
  final String text;
  final Widget icon;
}

class _MainBottomTabState extends ConsumerState<MainBottomTab> {
  var currentIndex = 0;
  List<BottomNavigationListType> tabList = [
    const BottomNavigationListType(
      text: '홈',
      icon: Icon(Icons.home),
    ),
    const BottomNavigationListType(
      text: '경기 목록',
      icon: Icon(Icons.sports_baseball),
    ),
    const BottomNavigationListType(
      text: '메세지',
      icon: Icon(Icons.message),
    ),
    const BottomNavigationListType(
      text: '마이 페이지',
      icon: Icon(Icons.person),
    ),
  ];

  void tap(int index) {
    if (index == currentIndex) {
      return;
    }

    setState(() {
      currentIndex = index;
    });

    if (index == 0) {
      context.goNamed(GoRoutes.home.name);
    } else if (index == 1) {
      context.goNamed(GoRoutes.matchList.name);
    } else if (index == 2) {
      context.goNamed(GoRoutes.message.name);
    } else if (index == 3) {
      context.goNamed(GoRoutes.my.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: widget.child,
      bottomNavigationBar: BottomAppBar(
        // surfaceTintColor: Colors.transparent,
        padding: const EdgeInsets.all(0),
        elevation: 0,

        child: Row(
          children: tabList.map((tab) {
            var index = tabList.indexOf(tab);
            return Expanded(
              child: InkWell(
                onTap: () => tap(index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    tab.icon,
                    const Gap(5),
                    Text(tab.text),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
