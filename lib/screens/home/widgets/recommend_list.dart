import 'package:flutter/material.dart';
import 'package:flutter_example/utils/router_config.dart';
import 'package:flutter_example/widgets/match_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RecommendList extends StatefulHookConsumerWidget {
  const RecommendList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RecommendListState();
}

class _RecommendListState extends ConsumerState<RecommendList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainer.withOpacity(0.5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '우리팀 직관',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Gap(15),
          Expanded(
            child: ListView.builder(
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
