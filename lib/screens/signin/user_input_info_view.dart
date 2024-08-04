import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/constants/constants.dart';
import 'package:flutter_example/widgets/app_bar.dart';
import 'package:flutter_example/widgets/button.dart';
import 'package:flutter_example/widgets/edit_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserInputInfoView extends StatefulHookConsumerWidget {
  const UserInputInfoView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserInputInfoViewState();
}

class _UserInputInfoViewState extends ConsumerState<UserInputInfoView> {
  var nickName = '';
  var selectList = [true, false];
  var pickedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    void selectDate() async {
      showCupertinoDialog(
        context: context,
        barrierDismissible: true, //showCupertinoDialog 영역 외에 눌렀을 때 닫게 해줌
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment
                .bottomCenter, //특정 위젯이 어디에 정렬을 해야되는지 모르면 height값줘도 최대한에 사이즈를 먹음
            child: Container(
              color: Colors.white,
              height: 300,
              child: CupertinoDatePicker(
                  maximumYear: DateTime.now().year,
                  mode: CupertinoDatePickerMode
                      .date, //CupertinoDatePickerMode에서 일시, 시간 등 고름
                  onDateTimeChanged: (DateTime date) {
                    setState(() {
                      pickedDate = date;
                    });
                  }), //날짜)
            ),
          );
        },
      );
    }

    void onPressedComplete() {
      // TODO : 팀선택 화면으로 이동
    }

    return Scaffold(
      appBar: const AppBarBack(
        title: '유저 정보 입력',
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Text(
              '닉네임',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(10),
            EditText(
              onChanged: (value) {
                setState(() {
                  nickName = value;
                });
              },
              hintText: '사용하실 닉네임을 입력해 주세요. (최대 10자)',
            ),
            const Gap(24),
            Text(
              '성별',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(10),
            ToggleButtons(
              constraints: const BoxConstraints.expand(
                height: 60,
                width: 60,
              ),
              fillColor: Theme.of(context).colorScheme.onSecondary,
              isSelected: selectList,
              children: [
                Text('남자',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectList[0] ? Colors.white : Colors.black)),
                Text('여자',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectList[1] ? Colors.white : Colors.black)),
              ],
              onPressed: (index) {
                setState(() {
                  selectList = selectList.map((e) => false).toList();
                  selectList[index] = true;
                });
              },
            ),
            const Gap(24),
            Text(
              '생년월일',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            GestureDetector(
              onTap: selectDate,
              child: IntrinsicWidth(
                child: Container(
                  decoration: const BoxDecoration(),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      const Icon(FontAwesomeIcons.calendar),
                      const Gap(16),
                      Text(
                        formatDate(pickedDate),
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Gap(24),
            Button(
              disabled: nickName.isEmpty ||
                  (pickedDate.day == DateTime.now().day &&
                      pickedDate.month == DateTime.now().month),
              onPressed: onPressedComplete,
              text: '완료',
            )
          ],
        ),
      )),
    );
  }
}
