import 'package:flutter/material.dart';
import 'package:flutter_example/constants/color_constants.dart';
import 'package:flutter_example/widgets/app_bar.dart';
import 'package:flutter_example/widgets/button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      appBar: const AppBarBack(
        title: '직관 상세',
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).colorScheme.surface,
                    width: 0.5,
                  ),
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.surface,
                    width: 0.5,
                  ),
                ),
              ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: TeamColors.ssg,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'SSG',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      const Gap(6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: TeamColors.nc,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'NC',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  const Text('6월 23일(일) 17:00 문학'),
                  const Gap(10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person_outlined),
                      Gap(3),
                      Text('1/5'),
                    ],
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
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceContainer
                          .withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      '우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스트우리 직관을 소개합니다. 소개 텍스',
                    ),
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Text(
                        '멤버',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 5),
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.fromBorderSide(
                              BorderSide(
                                color: Theme.of(context).colorScheme.surface,
                                width: 0.5,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const Gap(25),
                  const Icon(FontAwesomeIcons.heart),
                  const Gap(20),
                  Expanded(
                    child: Button(
                      onPressed: () {},
                      text: '참여하기',
                    ),
                  ),
                  const Gap(25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
