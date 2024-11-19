import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/widgets/api.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

enum LoginProvider {
  kakao,
  google,
  apple,
}

abstract class IAuthRepository {
  Future<void> signIn({
    required LoginProvider provider,
  });
  Future<void> signOut();
}

class AuthRepository implements IAuthRepository {
  const AuthRepository._();
  static AuthRepository instance = const AuthRepository._();

  @override
  Future<String?> signIn({required LoginProvider provider}) async {
    try {
      if (provider == LoginProvider.kakao) {
        var isInstalled = await isKakaoTalkInstalled();

        var token = isInstalled
            ? await UserApi.instance.loginWithKakaoTalk()
            : await UserApi.instance.loginWithKakaoAccount();

        var result = await dio.get(
          '/kakao/login',
          options: Options(
            headers: {
              'Authorization': 'Bearer ${token.accessToken}',
            },
          ),
        );
        return 'token';
      }
      if (provider == LoginProvider.google) {
        var googleSignIn = GoogleSignIn();
        var user = await googleSignIn.signIn();
        var googleAuth = await user?.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        var firebaseToken =
            await FirebaseAuth.instance.signInWithCredential(credential);

        debugPrint(
            'firebaseToken.credential?.accessToken:${firebaseToken.credential?.accessToken}');
        var result = await dio.get(
          '/google/login/token',
          queryParameters: {
            'access_token': firebaseToken.credential?.accessToken,
          },
          // options: Options(
          //   headers: {
          //     'Authorization': 'Bearer ${googleToken?.idToken}',
          //   },
          // ),
        );
        debugPrint('result.data:${result.data}');
        return 'token';
      }
      if (provider == LoginProvider.apple) {
        // var credential = await SignInWithApple.getAppleIDCredential(
        await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],

          // credential.identityToken != null && credential.userIdentifier != null
          // redirect_url 이 localhost면 로그인 안됨
          // https://developer.apple.com/documentation/sign_in_with_apple/sign_in_with_apple_js/incorporating_sign_in_with_apple_into_other_platforms
        );
        // TODO ios 개발자계정 결제후 app id 추가해야됨
        // print('credential:$credential');
        // Now send the credential (especially `credential.authorizationCode`) to your server to create a session
        // after they have been validated with Apple (see `Integration` section for more information on how to do this)
        return 'token';
      }
    } catch (e) {
      debugPrint('error: $e');
    }
    return null;
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
