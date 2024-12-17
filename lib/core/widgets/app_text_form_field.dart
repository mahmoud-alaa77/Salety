import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:task1intern/core/themes/app_text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final String hint;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enabledBorder;
  final Color? backgroundColor;
  final InputBorder? focusedBorder;
  final bool? obscureText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Function(String?) validator;
  final TextInputType? keyboardType;
  const AppTextFormField({
    super.key,
    this.suffixIcon,
    this.hintStyle,
    required this.hint,
    this.contentPadding,
    this.backgroundColor,
    this.enabledBorder,
    this.focusedBorder,
    this.obscureText,
    this.controller,
    this.prefixIcon,
    required this.validator, this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle ?? AppTextStyles.font16greyw200,
        contentPadding: contentPadding ??
            EdgeInsetsDirectional.symmetric(vertical: 20.h, horizontal: 18.w),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: enabledBorder ??
            const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  width: .2,
                  color: Colors.grey,
                )),
        focusedBorder: focusedBorder ??
            const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: .5,
                )),
        fillColor: backgroundColor ?? Colors.white.withOpacity(.8),
        filled: true,
      ),
      obscureText: obscureText ?? false,
    );
  }
}
