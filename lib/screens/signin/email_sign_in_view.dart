import 'package:flutter/material.dart';
import 'package:flutter_example/widgets/app_bar.dart';
import 'package:flutter_example/widgets/button.dart';
import 'package:flutter_example/widgets/edit_text.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmailSignInView extends StatefulHookConsumerWidget {
  const EmailSignInView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EmailSignInViewState();
}

class _EmailSignInViewState extends ConsumerState<EmailSignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBack(
        title: '이메일 로그인',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const Gap(40),
              EditText(
                autofocus: true,
                onChanged: (value) {},
                hintText: '이메일',
              ),
              const Gap(12),
              EditText(
                onChanged: (value) {},
                hintText: '비밀번호',
              ),
              const Gap(12),
              Button(
                disabled: true,
                onPressed: () {},
                text: '로그인',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
