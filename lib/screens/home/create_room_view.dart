import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_example/widgets/app_bar.dart';
import 'package:flutter_example/widgets/button.dart';
import 'package:flutter_example/widgets/edit_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class CreateRoomView extends StatefulHookConsumerWidget {
  const CreateRoomView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateRoomViewState();
}

class _CreateRoomViewState extends ConsumerState<CreateRoomView>
    with SingleTickerProviderStateMixin {
  var _scrollController = ScrollController();
  XFile? matchImage;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<XFile?> chooseImage({String? type, String? fileName}) async {
      var picker = ImagePicker();

      // var imgFile = type == 'camera'
      //     ? await picker.pickImage(source: ImageSource.camera)
      //     : await picker.pickImage(source: ImageSource.gallery);
      var imgFile = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        matchImage = imgFile;
      });
      return imgFile;
    }

    void onPressCreateMatch() async {
      setState(() {
        loading = true;
      });
      // TODO: 매치 생성 api
      setState(() {
        loading = false;
      });
      context.pop();
    }

    return Scaffold(
      appBar: const AppBarBack(
        title: '직관 모집',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Button(
                width: 120,
                height: 40,
                backgroundColor: Theme.of(context).colorScheme.primary,
                onPressed: () {},
                text: '경기 선택',
              ),
              const Gap(20),
              Row(
                children: [
                  Text(
                    '사진',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              const Gap(5),
              InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(7)),
                onTap: chooseImage,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.surface,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                  ),
                  child: matchImage == null
                      ? const Icon(FontAwesomeIcons.image)
                      : Image.file(
                          fit: BoxFit.cover,
                          File(matchImage!.path),
                        ),
                ),
              ),
              const Gap(20),
              Text(
                '정원',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Gap(5),
              Row(
                children: [
                  EditText(
                    onChanged: (value) {},
                    width: 50,
                    keyboardType: TextInputType.number,
                    hintText: '10',
                  ),
                  const Gap(10),
                  Text(
                    '최소 n 최대 n명 입니다',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                  ),
                ],
              ),
              const Gap(20),
              Text(
                '모임 이름',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Gap(5),
              EditText(
                onChanged: (value) {},
                hintText: '모임 이름을 입력해주세요',
              ),
              const Gap(20),
              Text(
                '모임 소개',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Gap(5),
              EditText(
                maxLength: 180,
                maxLines: null,
                padding: const EdgeInsets.all(0),
                borderRadius: const BorderRadius.all(Radius.circular(7)),
                onChanged: (value) {
                  // introduction.value = value;
                },
                hintText: '모임 소개를 입력해주세요',
              ),
              const Spacer(),
              Button(
                loading: loading,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                onPressed: onPressCreateMatch,
                text: '모임 생성',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
