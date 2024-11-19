import 'package:flutter/material.dart';
import 'package:flutter_example/screens/signin/user_input_info_view.dart';
import 'package:flutter_example/utils/router_config.dart';
import 'package:flutter_example/widgets/animated_switcher.dart';
import 'package:flutter_example/widgets/app_bar.dart';
import 'package:flutter_example/widgets/button.dart';
import 'package:flutter_example/widgets/edit_text.dart';
import 'package:flutter_example/widgets/error_text.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VerifyPhoneNumberView extends StatefulHookConsumerWidget {
  const VerifyPhoneNumberView({
    super.key,
    required this.token,
  });
  final String token;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerifyPhoneNumberViewState();
}

class _VerifyPhoneNumberViewState extends ConsumerState<VerifyPhoneNumberView> {
  var phoneTextController = TextEditingController();
  var name = '';
  var verifyNumber = '';
  var isPressedVerify = false;
  var errorText = '';

  @override
  Widget build(BuildContext context) {
    bool isValidPhoneNumber(String phoneNumber) {
      final RegExp regExp = RegExp(r'^010\d{8}$');
      return regExp.hasMatch(phoneNumber);
    }

    void onChangedName(String value) {
      setState(() {
        name = value;
      });
    }

    void onChangedPhoneNumber(String value) {
      if (phoneTextController.text.length == 11 &&
          !isValidPhoneNumber(phoneTextController.text)) {
        setState(() {
          errorText = '전화번호 형식이 올바르지 않습니다.';
        });
      } else {
        setState(() {
          errorText = '';
        });
      }

      setState(() {
        phoneTextController.text = value;
      });
    }

    void onChangedVerifyNumber(String value) {
      setState(() {
        verifyNumber = value;
      });
    }

    void onPressedRequestVerify() async {
      // var result =
      //     await dio.post('https://api.iamport.kr/users/getToken', data: {
      //   'imp_key': '7815234467244345',
      //   'imp_secret':
      //       'M1KeDE6k8tpNYgooUDpgNmttmdbItAkZBNvBz6pUk8mkvGsvqh2KObuNWHEXdhf89Vh4oY7YTUTZ49eb',
      // });
      // var accessToken = result.data['response']['access_token'];

      // await dio.post(
      //   'https://api.iamport.kr/certifications/otp/request',
      //   data: {
      //     "name": "구남규",
      //     "phone": "01055426071",
      //     "birth": "930114",
      //     "gender_digit": "1",
      //     "carrier": "KT",
      //     "is_mvno": true,
      //     // "company": "company",
      //     // "merchant_uid": "merchant_uid",
      //     // "pg": "pg",
      //   },
      //   options: Options(
      //     headers: {
      //       'Content-Type': 'application/json',
      //       'Authorization': 'Bearer $accessToken',
      //     },
      //   ),
      // );

      setState(() {
        isPressedVerify = true;
      });
    }

    void onPressedVerify() {
      // 번호 인증 확인 되면 토큰가지고 회원정보 입력화면으로 이동
      context.push(
        '${GoRoutes.signIn.fullPath}${GoRoutes.verifyPhoneNumber.fullPath}${GoRoutes.userInputInfo.fullPath}',
        extra: UserInputInfoView(token: widget.token),
      );
    }

    return Scaffold(
      appBar: const AppBarBack(
        title: '휴대폰 번호 인증',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(40),
              EditText(
                autofocus: true,
                onChanged: onChangedName,
                hintText: '이름을 입력해 주세요.',
                maxLength: 10,
              ),
              const Gap(12),
              EditText(
                controller: phoneTextController,
                onChanged: onChangedPhoneNumber,
                keyboardType: TextInputType.phone,
                hintText: '휴대폰 번호를 입력해 주세요.',
                maxLength: 11,
              ),
              ErrorText(errorText: errorText),
              const Gap(12),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                key: ValueKey(errorText == ''),
                child: Button(
                  disabled: name.isEmpty ||
                      phoneTextController.text.isEmpty ||
                      !isValidPhoneNumber(phoneTextController.text),
                  onPressed: onPressedRequestVerify,
                  text: '인증번호 받기',
                ),
              ),
              const Gap(45),
              AnimatedSwitcherProvider(
                child: isPressedVerify
                    ? Column(
                        children: [
                          EditText(
                            onChanged: onChangedVerifyNumber,
                            hintText: '인증번호를 입력해 주세요.',
                            maxLength: 10,
                          ),
                          const Gap(12),
                          Button(
                            disabled: verifyNumber == '',
                            onPressed: onPressedVerify,
                            text: '인증하기',
                          ),
                        ],
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
