import 'package:flutter/material.dart';
import 'package:flutter_example/widgets/button.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MatchTile extends HookConsumerWidget {
  const MatchTile({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('6/23(일)'),
                Text('17:00'),
                Text('문학'),
              ],
            ),
            Column(
              children: [
                const Row(
                  children: [
                    Text('NC     vs     SSG'),
                  ],
                ),
                const Gap(10),
                Row(
                  children: [
                    Button(
                      onPressed: () {},
                      text: '직관모집',
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                    ),
                    const Gap(5),
                    Button(
                      onPressed: () {},
                      text: '예매하기',
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
