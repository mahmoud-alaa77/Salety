import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function()? onTap;
  final IconData icon;
  final double iconSize;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final Color? iconColor;
  final EdgeInsets? padding;
  const CustomIconButton(
      {super.key,
      this.onTap,
      required this.icon,
      required this.iconSize,
      this.borderRadius,
      this.color,
      this.iconColor,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: const AlwaysStoppedAnimation(.7),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
            padding: padding ?? const EdgeInsetsDirectional.all(6),
            decoration: BoxDecoration(
                color: color ?? Colors.transparent,
                //border: Border.all(),
                borderRadius: borderRadius),
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor ?? Colors.black,
            )),
      ),
    );
  }
}
