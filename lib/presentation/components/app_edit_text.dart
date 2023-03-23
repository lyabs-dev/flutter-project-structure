import 'package:flutter/services.dart';
import 'package:lyabs_dev/utils/my_material.dart';

class AppEditText extends StatelessWidget {
  final String? hintText, labelText;
  final TextEditingController controller;
  final bool isPassword, showCursor,autofocus;
  final TextInputType inputType;
  final Function(String value)? onChanged;
  final double? width,borderRadius, height;
  final Color? color, backgroundColor, cursorColor;
  final InputBorder border, enabledBorder, focusedBorder;
  final EdgeInsets? padding, contentPadding;
  final Widget? suffixIcon;
  final TextStyle? hintStyle, labelStyle, style;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final int maxLines;
  final FocusNode? focusNode;
  final bool enabled;

  const AppEditText(this.hintText, this.controller,
      {
        super.key,
        this.isPassword = false,
      this.inputType = TextInputType.text,
      this.width,
        this.height,
      this.backgroundColor,
        this.onChanged,
      this.borderRadius = 0.0,
        this.autofocus = false,
        this.inputFormatters,
      this.cursorColor,
      this.padding,
      this.contentPadding = const EdgeInsets.only(left: 10),
      this.suffixIcon,
      this.border = InputBorder.none,
      this.enabledBorder = InputBorder.none,
      this.focusedBorder = InputBorder.none,
      this.hintStyle,
      this.labelStyle,
      this.style,
      this.labelText,
      this.prefixIcon,
      this.textAlign = TextAlign.start,
      this.color = Colors.grey,
      this.maxLines = 1,
      this.showCursor = true,
      this.focusNode,
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: TextFormField(
        showCursor: showCursor,
        obscureText: isPassword,
        controller: controller,
        keyboardType: inputType,
        focusNode: focusNode,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        autofocus: autofocus,
        minLines: 1,
        cursorColor: cursorColor,
        style: style,
        textAlign: textAlign!,
        enabled: enabled,

        decoration: InputDecoration(
          contentPadding: contentPadding,
          hintText: hintText,
          hintStyle: hintStyle,
          labelText: labelText,
          labelStyle: labelStyle,
          border: border,
          suffixIcon: suffixIcon,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
        ),
      ),
    );
  }
}
