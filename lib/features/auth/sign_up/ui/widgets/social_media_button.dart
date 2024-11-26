import 'package:flutter/material.dart';
import 'package:task1intern/core/helper/spacing.dart';

class SocialMediaButton extends StatelessWidget {
  final Color borderColor;
  final String label;
  final String imageUrl;
  final double width;
  final double height;
  final TextStyle? style;
  const SocialMediaButton(
      {super.key,
      required this.borderColor,
      required this.label,
      required this.imageUrl,
      required this.width,
      required this.height,
      this.style});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          // width: width,
          // height: height,
          padding:
              const EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: BorderRadiusDirectional.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: style,
              ),
              horizontalSpace(2),
              Image.asset(
                imageUrl,
                width: MediaQuery.sizeOf(context).width*.04,
              ),
            ],
          )),
    );
  }
}
