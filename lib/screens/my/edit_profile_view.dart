import 'package:flutter/material.dart';
import 'package:flutter_example/constants/color_constants.dart';
import 'package:flutter_example/utils/router_config.dart';
import 'package:flutter_example/widgets/app_bar.dart';
import 'package:flutter_example/widgets/button.dart';
import 'package:flutter_example/widgets/edit_text.dart';
import 'package:flutter_example/widgets/team_badge.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditProfileView extends HookConsumerWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void editBaseTeam() {}

    void goEditTagView() {
      context.push(GoRoutes.editMyTag.fullPath);
    }

    void completeEdit() {}

    Widget editContainer({
      required String title,
      required Widget child,
    }) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            Flexible(
              flex: 3,
              child: child,
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: const AppBarBack(
        title: '프로필 편집',
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Stack(
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
                          FontAwesomeIcons.camera,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          size: 15,
                        ),
                      ),
                    )
                  ],
                ),
                const Gap(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Material(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                      child: InkWell(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.only(
                              right: 10, bottom: 10, top: 10, left: 15),
                          child: Text('남'),
                        ),
                      ),
                    ),
                    Material(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      child: InkWell(
                        onTap: () {},
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              right: 15, bottom: 10, top: 10, left: 10),
                          child: Text('여'),
                        ),
                      ),
                    ),
                  ],
                ),
                editContainer(
                  title: '우리팀',
                  child: Row(
                    children: [
                      TeamBadge(
                        text: 'SSG',
                        backgroundColor: TeamColors.ssg,
                      ),
                      const Gap(8),
                      GestureDetector(
                        onTap: editBaseTeam,
                        child: const Text(
                          '수정',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                editContainer(
                  title: '이름',
                  child: EditText(
                    onChanged: (p0) {},
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceContainer,
                    borderColor: Colors.transparent,
                  ),
                ),
                editContainer(
                  title: '생년월일',
                  child: EditText(
                    onChanged: (p0) {},
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceContainer,
                    borderColor: Colors.transparent,
                  ),
                ),
                editContainer(
                  title: '소개',
                  child: EditText(
                    onChanged: (p0) {},
                    height: 100,
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceContainer,
                    borderColor: Colors.transparent,
                  ),
                ),
                const Gap(30),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          '소개태그',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      GestureDetector(
                        onTap: goEditTagView,
                        child: const Text(
                          '편집',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 10,
                    children: [
                      Chip(
                        label: const Text('카테고리'),
                        padding: const EdgeInsets.all(0),
                        side: const BorderSide(color: Colors.transparent),
                        backgroundColor:
                            Theme.of(context).colorScheme.surfaceContainer,
                      ),
                      Chip(
                        label: const Text('카테고리'),
                        padding: const EdgeInsets.all(0),
                        side: const BorderSide(color: Colors.transparent),
                        backgroundColor:
                            Theme.of(context).colorScheme.surfaceContainer,
                      ),
                      Chip(
                        label: const Text('카테고리'),
                        padding: const EdgeInsets.all(0),
                        side: const BorderSide(color: Colors.transparent),
                        backgroundColor:
                            Theme.of(context).colorScheme.surfaceContainer,
                      ),
                    ],
                  ),
                ),
                const Gap(30),
                Button(
                  onPressed: completeEdit,
                  text: '완료',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
