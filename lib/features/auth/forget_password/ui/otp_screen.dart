import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/custom_app_bar.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double shortSide = MediaQuery.sizeOf(context).shortestSide;
    // double longSide = MediaQuery.sizeOf(context).longestSide;
    bool isTablet = shortSide >= 600;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: isPortrait ? 24.r : shortSide / 6.r,
                vertical: 16.r),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                      title: "التحقق من الهاتف",
                      textStyle:isTablet ?AppTextStyles.font24BlackBold : AppTextStyles.font18BlackW300),
                  verticalSpace(isTablet ? 65 : 24),
                  Text(
                    " ادخل رمز ال OTP الخاص بك",
                    style: isTablet
                        ? AppTextStyles.font20greyw200.copyWith(fontSize: 24.sp)
                        : AppTextStyles.font16greyw200,
                  ),
                  verticalSpace(isTablet ? 120 : 65),
                  OtpTextField(
                    numberOfFields: 4,

                    fillColor: Colors.white,

                    enabledBorderColor: Colors.white,
                    focusedBorderColor: AppColors.greenColor,
                    showFieldAsBox: true,
                    fieldWidth: shortSide / 6,
                    fieldHeight: shortSide / 6,
                    keyboardType: TextInputType.number,
                    showCursor: false,
                    textStyle: AppTextStyles.font18BlackW300,
                    onCodeChanged: (String code) {},

                    filled: true,

                    onSubmit: (String verificationCode) {
                      context.pushNamed(Routes.forgetPassScreen);
                    }, // end onSubmit
                  ),
                  verticalSpace(48),
                  Text(
                    "لم يصل الكود ؟",
                    style: isTablet
                        ? AppTextStyles.font20greyw200
                        : AppTextStyles.font14greyw200,
                  ),
                  Text(
                    "اعادة ارسال رمز جديد",
                    style: isTablet
                        ? AppTextStyles.font18BlackW300
                            .copyWith(color: AppColors.redColor)
                        : AppTextStyles.font12greyw200
                            .copyWith(color: AppColors.redColor),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
