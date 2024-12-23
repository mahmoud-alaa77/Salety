import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/constants.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/helper_functions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/app_text_form_field.dart';
import 'package:task1intern/core/widgets/text_and_colored_buton.dart';
import 'package:task1intern/features/auth/widgets/auth_app_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthAppBar(screenWidth: screenWidth),
                isPortrait
                    ? buildLoginBody(context, screenHeight)
                    : Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: screenWidth / 6),
                        child: buildLoginBody(context, screenWidth),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

buildLoginBody(BuildContext context, double screenHeight) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Align(
        alignment: AlignmentDirectional.center,
        child: Image.asset(
          AppImages.horizontalLogoImage,
          width: 220.w,
        ),
      ),
      AppTextFormField(
        hint: "عنوان البريد الالكتروني",
        hintStyle: TextStyle(
            fontSize: HelperFunctions().getResponsiveFontSize(
              context,
              fontSize: 18,
            ),
            color: Colors.grey),
        suffixIcon: const Icon(
          Icons.done,
          color: AppColors.greenColor,
        ),
      ),
      verticalSpace(20),
      AppTextFormField(
        hint: "كلمة المرور",
        hintStyle: TextStyle(
            fontSize: HelperFunctions().getResponsiveFontSize(
              context,
              fontSize: 18,
            ),
            color: Colors.grey),
        obscureText: true,
        suffixIcon: const Icon(Icons.visibility_off),
      ),
      verticalSpace(4),
      TextButton(
        onPressed: () {
          context.pushNamed(Routes.checkPhoneScreen);
        },
        child: Text(
          "هل نسيت كلمة المرور",
          style: AppTextStyles.font18BlackW300.copyWith(
              fontSize: HelperFunctions()
                  .getResponsiveFontSize(context, fontSize: 18)),
        ),
      ),
      verticalSpace(32),
      TextAndColoredButton(
        height: screenHeight * .065,
        title: "تسجيل الدخول",
        width: double.infinity,
        color: AppColors.greenColor,
        onTap: () {
          context.pushNamed(Routes.mainScreen);
        },
      ),
      verticalSpace(48),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "ليس لديك حساب؟  ",
              style: AppTextStyles.font18BlackW300.copyWith(
                  fontSize: HelperFunctions()
                      .getResponsiveFontSize(context, fontSize: 18)),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                context.pushNamed(Routes.signUpScreen);
              },
              child: Text(
                "انشاء حساب",
                style: AppTextStyles.font18BlackW300.copyWith(
                    fontSize: HelperFunctions()
                        .getResponsiveFontSize(context, fontSize: 18)),
              ),
            ),
          )
        ],
      )
    ],
  );
}
