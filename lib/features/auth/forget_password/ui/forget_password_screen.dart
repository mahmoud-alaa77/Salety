import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/helper_functions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/app_text_form_field.dart';
import 'package:task1intern/core/widgets/custom_app_bar.dart';
import 'package:task1intern/core/widgets/text_and_colored_buton.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double shortSide = MediaQuery.sizeOf(context).shortestSide;
    bool isTablet = shortSide >= 600;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: isTablet ? shortSide / 6.r : 16.r, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                    title: "تغير كلمة المرور",
                    textStyle: isTablet
                        ? AppTextStyles.font24BlackBold
                        : AppTextStyles.font18BlackW300),
                verticalSpace(isTablet ? 65 : 24),
                isPortrait
                    ? buildBody(context, screenHeight, shortSide)
                    : Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: screenWidth / 6),
                        child: buildBody(context, screenHeight, shortSide),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildBody(
      BuildContext context, double screenHeight, double shortSide) {
    bool isTablet = shortSide >= 600;

    return Column(
      children: [
        AppTextFormField(
          hint: "كلمة المرور الحالية",
          hintStyle: TextStyle(
              fontSize: HelperFunctions().getResponsiveFontSize(
                context,
                fontSize: 18,
              ),
              color: Colors.grey),
          suffixIcon: const Icon(
            Icons.visibility,
          ),
        ),
        verticalSpace(20),
        AppTextFormField(
          hint: "كلمة مرور جديدة",
          hintStyle: TextStyle(
              fontSize: HelperFunctions().getResponsiveFontSize(
                context,
                fontSize: 18,
              ),
              color: Colors.grey),
          suffixIcon: const Icon(
            Icons.visibility,
          ),
        ),
        verticalSpace(48),
        TextAndColoredButton(
          height: isTablet ? shortSide * .065 : shortSide * .13,
          title: "تغيير",
          width: double.infinity,
          color: AppColors.greenColor,
          onTap: () {
            context.pushNamed(Routes.passChangedScreen);
          },
        ),
      ],
    );
  }
}
