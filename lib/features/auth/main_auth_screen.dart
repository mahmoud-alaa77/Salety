import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/constants.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/widgets/text_and_colored_buton.dart';

class MainAuthScreen extends StatelessWidget {
  const MainAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              AppImages.backGroundImage,
              width: isPortrait ? screenWidth / 3 : screenWidth / 5,
              fit: BoxFit.cover,
            ),
          ),
          isPortrait
              ? buildPrtraitLayOut(screenHeight, context, screenWidth)
              : Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: screenWidth / 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      Image.asset(
                        AppImages.horizontalLogoImage,
                        width: screenHeight / 2.5,
                      ),
                      verticalSpace(26),
                      TextAndColoredButton(
                        title: "تسجيل الدخول",
                        color: AppColors.redColor,
                        height: isTablet ? screenHeight / 12 : screenHeight / 8,
                        width: double.infinity,
                        margin: EdgeInsetsDirectional.symmetric(
                            horizontal: isTablet ? 65.w : 24.w),
                        onTap: () {
                          context.pushNamed(Routes.loginScreen);
                        },
                      ),
                      verticalSpace(screenHeight * .03),
                      TextAndColoredButton(
                        title: "انشئ حساب",
                        color: AppColors.greenColor,
                        height: isTablet ? screenHeight / 12 : screenHeight / 8,
                        width: double.infinity,
                        onTap: () {
                          context.pushNamed(Routes.signUpScreen);
                        },
                        margin: EdgeInsetsDirectional.symmetric(
                            horizontal: isTablet ? 65.w : 24.w),
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                )
        ],
      ),
    ));
  }

  Padding buildPrtraitLayOut(
      double screenHeight, BuildContext context, double screenWidth) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: screenWidth / 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 1,
          ),
          Image.asset(
            AppImages.horizontalLogoImage,
            width: screenHeight / 3.5,
          ),
          verticalSpace(26),
          TextAndColoredButton(
            title: "تسجيل الدخول",
            color: AppColors.redColor,
            height: screenHeight / 15,
            width: double.infinity,
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 24),
            onTap: () {
              context.pushNamed(Routes.loginScreen);
            },
          ),
          verticalSpace(24),
          TextAndColoredButton(
            title: "انشئ حساب",
            color: AppColors.greenColor,
            height: screenHeight / 15,
            width: double.infinity,
            onTap: () {
              context.pushNamed(Routes.signUpScreen);
            },
            margin: const EdgeInsetsDirectional.symmetric(horizontal: 24),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
