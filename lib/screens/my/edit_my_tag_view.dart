import 'package:flutter/material.dart';
import 'package:flutter_example/widgets/app_bar.dart';
import 'package:flutter_example/widgets/button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyTagModel {
  final String title;
  final bool isSelected;

  MyTagModel({
    required this.title,
    required this.isSelected,
  });
}

class EditMyTagView extends HookConsumerWidget {
  const EditMyTagView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var defaultInfoTags = useState([
      MyTagModel(title: '20대', isSelected: true),
      MyTagModel(title: '30대', isSelected: false),
    ]);

    Widget editTagContainer({
      required String title,
      required List<MyTagModel> tags,
      required Function(MyTagModel) onTap,
    }) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.normal,
                ),
          ),
          Wrap(
            spacing: 5,
            runSpacing: 10,
            children: tags.map((tag) {
              return GestureDetector(
                onTap: () => onTap(tag),
                child: Chip(
                  side: const BorderSide(color: Colors.transparent),
                  label: Text(tag.title),
                  backgroundColor: tag.isSelected
                      ? Theme.of(context).colorScheme.surfaceBright
                      : Theme.of(context).colorScheme.surface,
                  labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: tag.isSelected
                            ? Theme.of(context).scaffoldBackgroundColor
                            : Colors.black,
                      ),
                ),
              );
            }).toList(),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: const AppBarBack(
        title: '소개태그 편집',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              editTagContainer(
                onTap: (tag) {
                  defaultInfoTags.value = defaultInfoTags.value.map((e) {
                    if (e.title == tag.title) {
                      return MyTagModel(
                        title: e.title,
                        isSelected: true,
                      );
                    }
                    return MyTagModel(
                      title: e.title,
                      isSelected: false,
                    );
                  }).toList();
                },
                title: '기본정보',
                tags: defaultInfoTags.value,
              ),
              editTagContainer(
                onTap: (tag) {},
                title: '야구연차',
                tags: [],
              ),
              editTagContainer(
                onTap: (tag) {},
                title: 'MBTI',
                tags: [],
              ),
              editTagContainer(
                onTap: (tag) {},
                title: '응원 스타일',
                tags: [],
              ),
              const Gap(30),
              Button(
                text: '완료',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
