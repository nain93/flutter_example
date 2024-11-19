import 'package:flutter/material.dart';
import 'package:flutter_example/repositories/token_repository.dart';
import 'package:flutter_example/screens/home/create_room_view.dart';
import 'package:flutter_example/screens/home/home_view.dart';
import 'package:flutter_example/screens/home/match_detail.dart';
import 'package:flutter_example/screens/match_list/match_list_view.dart';
import 'package:flutter_example/screens/message/chat_room_view.dart';
import 'package:flutter_example/screens/message/message_view.dart';
import 'package:flutter_example/screens/my/edit_my_tag_view.dart';
import 'package:flutter_example/screens/my/edit_profile_view.dart';
import 'package:flutter_example/screens/my/my_view.dart';
import 'package:flutter_example/screens/signin/email_sign_in_view.dart';
import 'package:flutter_example/screens/signin/sign_in_view.dart';
import 'package:flutter_example/screens/signin/team_select_view.dart';
import 'package:flutter_example/screens/signin/user_input_info_view.dart';
import 'package:flutter_example/screens/signin/verify_phone_number_view.dart';
import 'package:flutter_example/widgets/main_bottom_tab.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

enum GoRoutes {
  signIn,
  emailSignIn,
  verifyPhoneNumber,
  userInputInfo,
  teamSelect,
  home,
  matchList,
  message,
  my,
  editProfile,
  editMyTag,
  createRoom,
  chatRoom,
  matchDetail,
}

extension GoRoutesName on GoRoutes {
  /// Convert to `lower-snake-case` format.
  String get path {
    var exp = RegExp(r'(?<=[a-z])[A-Z]');
    var result =
        name.replaceAllMapped(exp, (m) => '-${m.group(0)}').toLowerCase();
    return result;
  }

  /// Convert to `lower-snake-case` format with `/`.
  String get fullPath {
    var exp = RegExp(r'(?<=[a-z])[A-Z]');
    var result =
        name.replaceAllMapped(exp, (m) => '-${m.group(0)}').toLowerCase();
    return '/$result';
  }
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  int? duration,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration(milliseconds: duration ?? 120),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

CustomTransitionPage buildIosPageTransitions<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 180),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = const Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.easeOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

final routeProvider = Provider(
  (ref) => GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: GoRoutes.home.fullPath,
    redirect: (context, state) async {
      var token = await TokenRepository.instance.getToken();
      if (token == null &&
          state.fullPath != null &&
          !state.fullPath!.contains('/sign-in')) {
        /// 토큰 없으면 signIn으로 리다이렉트
        return GoRoutes.signIn.fullPath;
      }
      return null;
    },
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return MainBottomTab(
            child: child,
          );
        },
        routes: [
          GoRoute(
              name: GoRoutes.home.name,
              path: GoRoutes.home.fullPath,
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition<void>(
                  context: context,
                  state: state,
                  child: const HomeView(),
                );
              },
              routes: [
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  name: GoRoutes.createRoom.name,
                  path: GoRoutes.createRoom.path,
                  pageBuilder: (context, state) {
                    return buildIosPageTransitions<void>(
                      context: context,
                      state: state,
                      child: const CreateRoomView(),
                    );
                  },
                ),
              ]),
          GoRoute(
            name: GoRoutes.matchList.name,
            path: GoRoutes.matchList.fullPath,
            pageBuilder: (context, state) {
              return buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: const MatchListView(),
              );
            },
          ),
          GoRoute(
              name: GoRoutes.message.name,
              path: GoRoutes.message.fullPath,
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition<void>(
                  context: context,
                  state: state,
                  child: const MessageView(),
                );
              },
              routes: [
                GoRoute(
                  parentNavigatorKey: rootNavigatorKey,
                  name: GoRoutes.chatRoom.name,
                  path: GoRoutes.chatRoom.path,
                  pageBuilder: (context, state) {
                    return buildIosPageTransitions<void>(
                      context: context,
                      state: state,
                      child: const ChatRoomView(),
                    );
                  },
                ),
              ]),
          GoRoute(
              name: GoRoutes.my.name,
              path: GoRoutes.my.fullPath,
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition<void>(
                  context: context,
                  state: state,
                  child: const MyView(),
                );
              },
              routes: [
                GoRoute(
                  name: GoRoutes.editProfile.name,
                  path: GoRoutes.editProfile.path,
                  pageBuilder: (context, state) {
                    return buildIosPageTransitions<void>(
                      context: context,
                      state: state,
                      child: const EditProfileView(),
                    );
                  },
                ),
              ]),
        ],
      ),
      GoRoute(
        name: GoRoutes.signIn.name,
        path: GoRoutes.signIn.fullPath,
        pageBuilder: (context, state) {
          return buildIosPageTransitions<void>(
            context: context,
            state: state,
            child: const SignInView(),
          );
        },
        routes: [
          GoRoute(
            name: GoRoutes.verifyPhoneNumber.name,
            path: GoRoutes.verifyPhoneNumber.path,
            pageBuilder: (context, state) {
              var verifyPhoneNumber = state.extra as VerifyPhoneNumberView;
              return buildIosPageTransitions<void>(
                context: context,
                state: state,
                child: VerifyPhoneNumberView(
                  token: verifyPhoneNumber.token,
                ),
              );
            },
            routes: [
              GoRoute(
                name: GoRoutes.userInputInfo.name,
                path: GoRoutes.userInputInfo.path,
                pageBuilder: (context, state) {
                  var userInputInfo = state.extra as UserInputInfoView;
                  return buildIosPageTransitions<void>(
                    context: context,
                    state: state,
                    child: UserInputInfoView(
                      token: userInputInfo.token,
                    ),
                  );
                },
                routes: [
                  GoRoute(
                    name: GoRoutes.teamSelect.name,
                    path: GoRoutes.teamSelect.path,
                    pageBuilder: (context, state) {
                      var teamSelect = state.extra as TeamSelectView;
                      return buildIosPageTransitions<void>(
                        context: context,
                        state: state,
                        child: TeamSelectView(
                          token: teamSelect.token,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            name: GoRoutes.emailSignIn.name,
            path: GoRoutes.emailSignIn.path,
            pageBuilder: (context, state) {
              return buildIosPageTransitions<void>(
                context: context,
                state: state,
                child: const EmailSignInView(),
              );
            },
          ),
        ],
      ),
      GoRoute(
        name: GoRoutes.matchDetail.name,
        path: GoRoutes.matchDetail.fullPath,
        pageBuilder: (context, state) {
          return buildIosPageTransitions<void>(
            context: context,
            state: state,
            child: const MatchDetail(),
          );
        },
      ),
      GoRoute(
        name: GoRoutes.editMyTag.name,
        path: GoRoutes.editMyTag.fullPath,
        pageBuilder: (context, state) {
          return buildIosPageTransitions<void>(
            context: context,
            state: state,
            child: const EditMyTagView(),
          );
        },
      ),
    ],
  ),
);
