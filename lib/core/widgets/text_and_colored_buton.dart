import 'package:flutter/material.dart';
import 'package:task1intern/core/helper/helper_functions.dart';

class TextAndColoredButton extends StatelessWidget {
  final double height;
  final void Function()? onTap;
  final String title;
  final double width;
  final Color color;
  final Color? fontColor;
  final double? fontSize;

  final EdgeInsetsGeometry? margin;
  const TextAndColoredButton(
      {super.key,
      required this.height,
      this.onTap,
      required this.title,
      required this.width,
      required this.color,
      this.margin,
      this.fontColor,  this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: fontColor ?? Colors.white,
                fontSize:fontSize ?? HelperFunctions()
                    .getResponsiveFontSize(context, fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
