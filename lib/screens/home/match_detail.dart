import 'package:flutter/material.dart';
import 'package:flutter_example/widgets/app_bar.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MatchDetail extends StatefulHookConsumerWidget {
  const MatchDetail({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MatchDetailState();
}

class _MatchDetailState extends ConsumerState<MatchDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      appBar: const AppBarBack(
        title: '직관 상세',
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.amber,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(30),
                  Text(
                    "직관 모집 제목: 같이 야구보러 가자자",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Text(
                        '모임 소개',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const Gap(5),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      '우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스...',
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
