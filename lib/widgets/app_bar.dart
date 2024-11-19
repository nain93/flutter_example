import 'package:flutter/material.dart';
import 'package:flutter_example/widgets/button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class AppBarBack extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBack({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.isBottomBorderDisplayed = false,
    this.bottomBorderStyle = const BottomBorderStyle(),
    this.onPressedBack,
    this.leadingWidth,
  });
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool isBottomBorderDisplayed;
  final BottomBorderStyle bottomBorderStyle;
  final VoidCallback? onPressedBack;
  final double? leadingWidth;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title == null
          ? const SizedBox()
          : Text(
              title!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
      leadingWidth: leadingWidth,
      backgroundColor: Colors.white,
      leading: leading ??
          CircleIconButton(
            backgroundColor: Colors.white,
            icon: const FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: Colors.black,
              size: 18,
            ),
            onPressed: () {
              if (onPressedBack != null) {
                onPressedBack!();
                return;
              }
              context.pop();
            },
          ),
      elevation: 0,
      titleSpacing: 0.0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      bottom: isBottomBorderDisplayed
          ? PreferredSize(
              preferredSize: Size.fromHeight(bottomBorderStyle.height),
              child: Container(
                color: bottomBorderStyle.color,
                height: bottomBorderStyle.height,
              ),
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BottomBorderStyle {
  const BottomBorderStyle({
    this.color = Colors.grey,
    this.height = 1,
  });
  final Color color;
  final double height;
}
