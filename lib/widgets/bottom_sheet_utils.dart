import 'package:flutter/material.dart';

class BottomSheetUtils {
  static Future<T?> showRoundedBottomSheet<T>(
    BuildContext context,
    Widget child, {
    Color backgroundColor = Colors.white,
    double borderRadius = 50.0,
    Color barrierColor = const Color(0x33000000),
    bool isDismissible = true,
    bool useRootNavigator = true,
    bool enableDrag = true,
    List<BoxShadow>? boxShadow,
    Function()? onClose,
    bool showDragHandle = false,
    double? height,
    EdgeInsetsGeometry? padding,
  }) {
    return showModalBottomSheet<T>(
      useSafeArea: true,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      context: context,
      isScrollControlled: true,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor,
      barrierColor: barrierColor,
      showDragHandle: showDragHandle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      builder: (context) {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Material(
            color: backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
            ),
            child: Container(
              height: height,
              padding: padding ??
                  const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius),
                ),
                boxShadow: boxShadow,
              ),
              child: child,
            ),
          ),
        );
      },
    )..whenComplete(() => onClose?.call());
  }
}
