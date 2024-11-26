import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/text_and_colored_buton.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double shortSide = MediaQuery.sizeOf(context).shortestSide;
    bool isTablet = shortSide >= 600;

    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.greenColor,
      body: Align(
        alignment: AlignmentDirectional.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Container(
              width: isTablet ? shortSide / 3 : shortSide / 2,
              height: isTablet ? shortSide / 3 : shortSide / 2,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                  )),
              child: Center(
                child: Image.asset(
                  "assets/images/key.png",
                  width: isTablet ? shortSide / 5 : shortSide / 3.1,
                ),
              ),
            ),
            verticalSpace(isTablet? 48:24),
            Text(
              "تم تغيير كلمة المرور الخاصة بك",
              style: isTablet
                  ? AppTextStyles.font24WhiteBold.copyWith(fontSize: 28.sp)
                  : AppTextStyles.font18BlackW300.copyWith(color: Colors.white),
            ),
            verticalSpace(isTablet? 48:16),
            TextAndColoredButton(
              height: isTablet ? 65.h : 50.h,
              title: "تم",
              width: isTablet ? shortSide / 3 : shortSide / 2,
              color: Colors.white,
              fontColor: AppColors.redColor,
              onTap: () {
                context.pushNamed(Routes.loginScreen);
              },
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    ));
  }
}
