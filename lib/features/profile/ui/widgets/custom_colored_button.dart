import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';

class CustomColoredButton extends StatelessWidget {
  final bool isTablet;
  final IconData icon;
  final String text;
  final Color color;
  const CustomColoredButton(
      {super.key,
      required this.isTablet,
      required this.icon,
      required this.text,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          margin: EdgeInsetsDirectional.all(isTablet ? 36.r : 12.r),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.3),
                    borderRadius: BorderRadius.circular(12.r)),
                padding: const EdgeInsetsDirectional.all(8),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: isTablet ? 45.w : 30.w,
                ),
              ),
              verticalSpace(12),
              Text(
                text,
                style: isTablet
                    ? AppTextStyles.font22BlackBold
                    : AppTextStyles.font18BlackW300,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
