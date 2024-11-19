import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomErrorWidget extends HookWidget {
  const CustomErrorWidget({
    super.key,
    required this.error,
    this.size,
  });

  final Object? error;
  final double? size;

  @override
  Widget build(BuildContext context) {
    String errorText = '오류가 발생했습니다. 다시 시도해주세요.';
    if (kDebugMode && error != null) {
      if (error is DioException) {
        errorText = (error as DioException).message.toString();
      } else {
        errorText = error.toString();
      }
    }

    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: Text(
          errorText,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
        ),
      ),
    );
  }
}
