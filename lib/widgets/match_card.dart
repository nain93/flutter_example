import 'package:flutter/material.dart';
import 'package:flutter_example/models/match_model.dart';
import 'package:flutter_example/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MatchCard extends StatefulHookConsumerWidget {
  const MatchCard({
    super.key,
    required this.match,
  });
  final MatchModel match;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MatchCardState();
}

class _MatchCardState extends ConsumerState<MatchCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${Utils.dateStringFormat(date: widget.match.createdAt)} 경기',
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
    );
  }
}
