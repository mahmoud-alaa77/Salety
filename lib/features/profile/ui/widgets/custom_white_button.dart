import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';

class CustomWhiteButton extends StatelessWidget {
  final bool isTablet;
  final IconData icon;
  final String text;
  final void Function()? onTap;
  const CustomWhiteButton(
      {super.key,
      required this.isTablet,
      required this.icon,
      required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: Colors.white,
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.redColor,
              size: isTablet ? 45.w : 30.w,
            ),
            verticalSpace(12),
            Text(
              text,
              style: isTablet
                  ? AppTextStyles.font22BlackBold
                  : AppTextStyles.font14BlackW300,
            ),
          ],
        )),
      ),
    );
  }
}
