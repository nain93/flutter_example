import 'package:flutter/material.dart';
import 'package:flutter_example/utils/router_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyView extends StatefulHookConsumerWidget {
  const MyView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyViewState();
}

class _MyViewState extends ConsumerState<MyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.push(
                          '${GoRoutes.my.fullPath}${GoRoutes.editProfile.fullPath}',
                        );
                      },
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Icon(
                                FontAwesomeIcons.pencil,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                size: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Gap(10),
                    Text(
                      '이름(닉네임)',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      '남 / 1999.09.09',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Chip(
                          label: const Text('카테고리'),
                          padding: const EdgeInsets.all(0),
                          side: const BorderSide(color: Colors.transparent),
                          backgroundColor:
                              Theme.of(context).colorScheme.surfaceContainer,
                        ),
                        const Gap(5),
                        Chip(
                          label: const Text('20대'),
                          padding: const EdgeInsets.all(0),
                          side: const BorderSide(color: Colors.transparent),
                          backgroundColor:
                              Theme.of(context).colorScheme.surfaceContainer,
                        ),
                        const Gap(5),
                        Chip(
                          label: const Text('직관초보'),
                          padding: const EdgeInsets.all(0),
                          side: const BorderSide(color: Colors.transparent),
                          backgroundColor:
                              Theme.of(context).colorScheme.surfaceContainer,
                        ),
                        const Gap(5),
                        Chip(
                          label: const Text('직관초보'),
                          padding: const EdgeInsets.all(0),
                          side: const BorderSide(color: Colors.transparent),
                          backgroundColor:
                              Theme.of(context).colorScheme.surfaceContainer,
                        ),
                        const Gap(5),
                        Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              height: 50,
            ),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '나의 직관',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Gap(10),
                    Text(
                      '신고 내역',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Gap(10),
                    Text(
                      '설정',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            )
            // Button(
            //   onPressed: () async {
            //     await ref.read(authProviderProvider.notifier).signOut();
            //     if (context.mounted) {
            //       context.go(GoRoutes.signIn.fullPath);
            //     }
            //   },
            //   text: '로그아웃',
            // ),),
          ],
        ),
      ),
    );
  }
}
