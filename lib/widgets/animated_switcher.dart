import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnimatedSwitcherProvider extends StatefulHookConsumerWidget {
  const AnimatedSwitcherProvider({
    super.key,
    required this.child,
    this.duration,
  });
  final Widget child;
  final int? duration;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AnimatedSwitcherProviderState();
}

class _AnimatedSwitcherProviderState
    extends ConsumerState<AnimatedSwitcherProvider> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      duration: Duration(milliseconds: widget.duration ?? 300),
      child: widget.child,
    );
  }
}
