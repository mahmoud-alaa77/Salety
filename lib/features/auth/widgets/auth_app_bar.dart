import 'package:flutter/material.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/helper_functions.dart';
import 'package:task1intern/core/widgets/custom_icon_button.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          icon: Icons.camera_alt_outlined,
          iconSize: HelperFunctions()
              .getResponsiveWidth(context, width: screenWidth / 14),
          borderRadius: BorderRadius.circular(12),
        ),
        CustomIconButton(
          icon: Icons.arrow_forward_ios,
          iconSize: HelperFunctions()
              .getResponsiveWidth(context, width: screenWidth / 14),
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            context.pop();
          },
        ),
      ],
    );
  }
}
