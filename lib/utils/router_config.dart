import 'package:flutter/material.dart';
import 'package:flutter_example/screens/home/create_room_view.dart';
import 'package:flutter_example/screens/home/home_view.dart';
import 'package:flutter_example/screens/match_list/match_list_view.dart';
import 'package:flutter_example/screens/message/chat_room_view.dart';
import 'package:flutter_example/screens/message/message_view.dart';
import 'package:flutter_example/screens/my/my_view.dart';
import 'package:flutter_example/widgets/main_bottom_tab.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

enum GoRoutes {
  home,
  matchList,
  message,
  my,
  createRoom,
  chatRoom,
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
    redirect: (context, state) {
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
          ),
        ],
      ),
    ],
  ),
);
