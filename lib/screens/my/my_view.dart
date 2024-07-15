import 'package:flutter/material.dart';
import 'package:flutter_example/providers/auth_provider.dart';
import 'package:flutter_example/utils/router_config.dart';
import 'package:flutter_example/widgets/button.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyView extends StatefulHookConsumerWidget {
  const MyView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyViewState();
}

class _MyViewState extends ConsumerState<MyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                onPressed: () async {
                  await ref.read(authProviderProvider.notifier).signOut();
                  if (context.mounted) {
                    context.go(GoRoutes.signIn.fullPath);
                  }
                },
                text: '로그아웃',
              )
            ],
          ),
        ),
      ),
    );
  }
}
