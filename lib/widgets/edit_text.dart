import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditText extends StatefulWidget {
  const EditText({
    super.key,
    required this.onChanged,
    this.style,
    this.decoration,
    this.keyboardType,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.width,
    this.height,
    this.borderRadius,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.maxLines = 1,
    this.maxLength,
    this.padding,
    this.inputPadding,
    this.focusNode,
    this.onSubmitted,
    this.onTap,
    this.borderColor,
    this.inputFormatters,
    this.autofocus,
    this.counterText,
  });

  final void Function(String) onChanged;
  final TextStyle? style;
  final String? hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? inputPadding;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final Color? borderColor;
  final bool? autofocus;
  final String? counterText;

  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
        color: widget.backgroundColor ?? Colors.transparent,
      ),
      height: widget.height,
      width: widget.width,
      child: TextField(
        autofocus: widget.autofocus ?? false,
        onTap: widget.onTap,
        inputFormatters: widget.inputFormatters,
        onSubmitted: widget.onSubmitted,
        focusNode: widget.focusNode,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        controller: widget.controller,
        obscureText: widget.obscureText,
        enableSuggestions: widget.enableSuggestions,
        autocorrect: widget.autocorrect,
        cursorColor: Theme.of(context).colorScheme.secondary,
        style: Theme.of(context).textTheme.bodyMedium?.merge(widget.style),
        decoration: InputDecoration(
          counterText: widget.counterText,
          suffixIcon: widget.suffixIcon,
          contentPadding: widget.inputPadding ?? const EdgeInsets.all(15),
          hintText: widget.hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              )
              .merge(widget.style),
          enabledBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
            borderSide: BorderSide(
              color:
                  widget.borderColor ?? Theme.of(context).colorScheme.surface,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
            borderSide: BorderSide(
              color:
                  widget.borderColor ?? Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        onChanged: (txt) => widget.onChanged(txt),
        keyboardType: widget.keyboardType,
      ),
    );
  }
}

OutlineInputBorder focusedOutlineBorder = const OutlineInputBorder(
  borderSide: BorderSide(width: 1.5, color: Colors.black87),
  borderRadius: BorderRadius.all(Radius.circular(8)),
);

OutlineInputBorder outlineBorder = const OutlineInputBorder(
  borderSide: BorderSide(width: 1, color: Colors.black87),
  borderRadius: BorderRadius.all(Radius.circular(8)),
);

OutlineInputBorder disableBorder = const OutlineInputBorder(
  borderSide: BorderSide(width: 1, color: Colors.black26),
  borderRadius: BorderRadius.all(Radius.circular(8)),
);

OutlineInputBorder focusedErrorBorder = const OutlineInputBorder(
  borderSide: BorderSide(width: 1.5, color: Colors.redAccent),
  borderRadius: BorderRadius.all(Radius.circular(8)),
);

OutlineInputBorder errorBorder = const OutlineInputBorder(
  borderSide: BorderSide(width: 1, color: Colors.redAccent),
  borderRadius: BorderRadius.all(Radius.circular(8)),
);

class EditFormText extends StatelessWidget {
  const EditFormText({
    super.key,
    this.focusNode,
    this.margin,
    this.padding,
    this.label = '',
    this.hintText,
    this.cursorColor,
    this.errorText,
    this.textEditingController,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.textInputAction,
    this.validator,
    this.keyboardType,
    this.isSecret = false,
    this.hasChecked = false,
    this.showBorder = true,
    this.minLines = 1,
    this.maxLines = 1,
    this.inputDecoration,
    this.labelStyle,
    this.textStyle = const TextStyle(
      fontSize: 16.0,
    ),
    this.hintStyle = const TextStyle(
      fontSize: 16.0,
    ),
    this.errorStyle = const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    this.onTap,
    this.prefixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLength,
  });
  final FocusNode? focusNode;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final String label;
  final int minLines;
  final int maxLines;
  final InputDecoration? inputDecoration;
  final TextStyle? labelStyle;
  final TextStyle textStyle;
  final String? hintText;
  final Color? cursorColor;
  final TextStyle hintStyle;
  final String? errorText;
  final TextStyle errorStyle;
  final bool isSecret;
  final bool hasChecked;
  final bool showBorder;
  final TextInputType? keyboardType;
  final TextEditingController? textEditingController;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Widget? prefixIcon;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    label,
                    style: labelStyle ?? Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              : const SizedBox(),
          Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              TextFormField(
                key: key,
                maxLength: maxLength,
                validator: validator,
                keyboardType: keyboardType,
                obscureText: isSecret,
                focusNode: focusNode,
                minLines: minLines,
                cursorColor: cursorColor,
                maxLines: maxLines,
                controller: textEditingController,
                enabled: enabled,
                readOnly: readOnly,
                autofocus: autofocus,

                /// Set default [InputDecoration] below instead of constructor
                /// because we need to apply optional parameters given in other props.
                ///
                /// You can pass [inputDecoration] to replace default [InputDecoration].
                decoration: inputDecoration ??
                    InputDecoration(
                      prefixIcon: prefixIcon,
                      counterText: '',
                      // focusColor: AppColors.text.basic,
                      // fillColor: !enabled
                      //     ? AppColors.bg.borderContrast
                      //     : AppColors.bg.basic,
                      filled: !enabled,
                      disabledBorder:
                          showBorder ? disableBorder : InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                      focusedBorder:
                          showBorder ? focusedOutlineBorder : InputBorder.none,
                      enabledBorder:
                          showBorder ? outlineBorder : InputBorder.none,
                      errorBorder: showBorder ? errorBorder : InputBorder.none,
                      focusedErrorBorder:
                          showBorder ? focusedErrorBorder : InputBorder.none,
                      hintText: hintText,
                      hintStyle: hintStyle,
                      errorText: errorText,
                      errorMaxLines: 2,
                      errorStyle: errorStyle,
                    ),
                style: textStyle.merge(TextStyle(
                  color:
                      !enabled ? Theme.of(context).colorScheme.surface : null,
                )),
                onChanged: onChanged,
                onFieldSubmitted: onSubmitted,
                onEditingComplete: onEditingComplete,
                textInputAction: textInputAction,
                onTap: onTap,
                autocorrect: false,
              ),
              hasChecked
                  ? const Positioned(
                      right: 0.0,
                      top: 16.0,
                      child: Icon(
                        Icons.check,
                      ),
                    )
                  : Container(),
            ],
          )
        ],
      ),
    );
  }
}
