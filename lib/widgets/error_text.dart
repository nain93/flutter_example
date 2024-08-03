import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorText extends HookConsumerWidget {
  const ErrorText({
    super.key,
    required this.errorText,
    this.style,
  });
  final String errorText;
  final TextStyle? style;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      errorText,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(
            color: Theme.of(context).colorScheme.error,
          )
          .merge(style),
    );
  }
}
