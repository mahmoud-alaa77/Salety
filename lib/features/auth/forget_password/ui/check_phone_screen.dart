import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/custom_app_bar.dart';
import 'package:task1intern/core/widgets/text_and_colored_buton.dart';

class CheckPhoneScreen extends StatelessWidget {
  const CheckPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double shortSide = MediaQuery.sizeOf(context).shortestSide;
    double longSide = MediaQuery.sizeOf(context).longestSide;
    bool isTablet = shortSide >= 600;
    //  bool isPortrait =
    //     MediaQuery.of(context).orientation == Orientation.portrait;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: isTablet ? shortSide / 6 : 24.r, vertical: 16.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                  title: "تحقق من رقم الهاتف",
                  textStyle: isTablet
                      ? AppTextStyles.font24BlackBold
                      : AppTextStyles.font18BlackW300),
              verticalSpace(isTablet ? 65 : 24),
              Text(
                "لقد ارسلنا لك رسالة نصيه قصيره تحتوي علي رمز الي رقم 01007035909",
                style: isTablet
                    ? AppTextStyles.font20greyw200.copyWith(fontSize: 25.sp)
                    : AppTextStyles.font18greyw200,
              ),
              verticalSpace(isTablet ? 125 : 65),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: isTablet ? 80.r : 12.r),
                child: IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'رقم الهاتف',
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12.r)),
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12.r)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.greenColor),
                        borderRadius: BorderRadius.circular(12.r)),
                  ),
                  initialCountryCode: 'EG',
                  onChanged: (phone) {},
                ),
              ),
              verticalSpace(isTablet ? 80 : 48),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: isTablet ? 80.r : 12.r),
                child: Align(
                  alignment: AlignmentDirectional.center,
                  child: TextAndColoredButton(
                    height: isTablet ? longSide / 18 : longSide / 15,
                    title: "تأكيد",
                    width: shortSide,
                    color: AppColors.greenColor,
                    onTap: () {
                      context.pushNamed(Routes.otpScreen);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
