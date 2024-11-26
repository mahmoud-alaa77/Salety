import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';

class LogoWithText extends StatelessWidget {
  const LogoWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Image.asset(
            "assets/images/logo.png",
            width: 150.w,
          ),
          Text(
            "سلتي",
            style: AppTextStyles.font24RedBold,
          ),
          Text(
            "SELATY",
            style: AppTextStyles.font22BlackBold.copyWith(letterSpacing: 5),
          ),
        ],
      ),
    );
  }
}
