import 'package:flutter/material.dart';
import 'package:flutter_example/utils/router_config.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends StatefulHookConsumerWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context
            .push('${GoRoutes.home.fullPath}${GoRoutes.createRoom.fullPath}'),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '오늘의 직관',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Gap(15),
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '6/4 경기',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const Text('4명중에 4명 확정'),
                    Text(
                      'memo',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const Text('18시까지 3번 출구에서 만나요 룰루랄라룰루랄라'),
                  ],
                ),
              ),
              const Gap(20),
              Text(
                '다음 직관',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Gap(15),
              Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '6/6 경기',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const Text('4명중에 4명 확정'),
                    Text(
                      'memo',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const Text('18시까지 3번 출구에서 만나요 룰루랄라룰루랄라'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
