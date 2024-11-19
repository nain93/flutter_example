import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/repositories/auth_repository.dart';
import 'package:flutter_example/screens/signin/verify_phone_number_view.dart';
import 'package:flutter_example/utils/router_config.dart';
import 'package:flutter_example/widgets/api.dart';
import 'package:flutter_example/widgets/button.dart';
import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SignInView extends StatefulHookConsumerWidget {
  const SignInView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  var kakaoLoading = false;
  var textStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    Future<void> handleKakaoLogin() async {
      setState(() {
        kakaoLoading = true;
      });

      setState(() {
        kakaoLoading = false;
      });
    }

    // void handleEmailLogin() {
    //   context
    //       .push('${GoRoutes.signIn.fullPath}${GoRoutes.emailSignIn.fullPath}');
    // }

    void handleLogin({
      required LoginProvider provider,
    }) async {
      var token = await AuthRepository.instance.signIn(provider: provider);
      // if (context.mounted) {
      //   context.push(
      //     '${GoRoutes.signIn.fullPath}${GoRoutes.verifyPhoneNumber.fullPath}',
      //     extra: const VerifyPhoneNumberView(token: ''),
      //   );
      // }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Spacer(),
              Button(
                onPressed: () => handleLogin(provider: LoginProvider.kakao),
                textStyle: textStyle,
                backgroundColor: const Color(0XFFFAE100),
                borderRadius: 5,
                text: '카카오톡으로 시작하기',
                loading: kakaoLoading,
                loadingColor: Colors.black,
              ),
              const Gap(10),
              // Button(
              //   onPressed: () {},
              //   borderColor: Colors.black,
              //   borderWidth: 1,
              //   textStyle: textStyle.copyWith(color: Colors.white),
              //   backgroundColor: const Color(0XFF19CE60),
              //   borderRadius: 5,
              //   text: '네이버로 시작하기',
              // ),
              // const Gap(10),
              Button(
                onPressed: () => handleLogin(provider: LoginProvider.google),
                borderColor: Colors.black,
                borderWidth: 1,
                borderRadius: 5,
                textStyle: textStyle,
                backgroundColor: Colors.white,
                text: '구글로 시작하기',
              ),
              const Gap(10),
              Platform.isIOS
                  ? Button(
                      onPressed: () =>
                          handleLogin(provider: LoginProvider.apple),
                      borderColor: Colors.white,
                      borderWidth: 1,
                      textStyle: textStyle.copyWith(color: Colors.white),
                      backgroundColor: Colors.black,
                      borderRadius: 5,
                      text: '애플로 시작하기',
                    )
                  : const SizedBox(),
              const Gap(10),
              // Button(
              //   onPressed: handleEmailLogin,
              //   borderColor: Colors.black,
              //   borderWidth: 1,
              //   textStyle: textStyle.copyWith(color: Colors.white),
              //   backgroundColor: Theme.of(context).colorScheme.primary,
              //   borderRadius: 5,
              //   text: '이메일로 시작하기',
              // ),
              const Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}
