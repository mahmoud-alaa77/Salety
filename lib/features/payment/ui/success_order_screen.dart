import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/custom_app_bar.dart';
import 'package:task1intern/core/widgets/text_and_colored_buton.dart';

class SuccessOrderScreen extends StatelessWidget {
  const SuccessOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    double shortSide = MediaQuery.sizeOf(context).shortestSide;

    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: isTablet
            ? buildTabletLayout(
                isPortrait, screenWidth, shortSide, screenHeight, context)
            : buildMobileLayout(
                isPortrait, screenWidth, shortSide, screenHeight, context),
      ),
    );
  }

  Padding buildMobileLayout(bool isPortrait, double screenWidth,
      double shortSide, double screenHeight, BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: isPortrait ? 16.r : shortSide / 6, vertical: 16.r),
      child: Column(
        children: [
          CustomAppBar(
              title: "عربة التسوق",
              textStyle: isPortrait
                  ? AppTextStyles.font18BlackW300
                  : AppTextStyles.font12BlackW300),
          verticalSpace(isPortrait ? 32 : 0),
          Expanded(
            child: Container(
              margin: EdgeInsetsDirectional.symmetric(
                  horizontal: isPortrait ? 12.r : shortSide / 3,
                  vertical: !isPortrait ? 0 : shortSide / 6),
              width: screenWidth,
              decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadiusDirectional.circular(16.r)),
              child: Column(
                children: [
                  const Spacer(
                    flex: 4,
                  ),
                  Image.asset(
                    "assets/images/success_bag_icon.png",
                    //color: AppColors.redColor,
                    width: isPortrait ? shortSide / 2.5 : shortSide / 6,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    "طلبك ناجح !",
                    style: isPortrait
                        ? AppTextStyles.font20BlackW400
                            .copyWith(color: Colors.white)
                        : AppTextStyles.font8BlackW300
                            .copyWith(color: Colors.white),
                  ),
                  verticalSpace(isPortrait ? 8 : 2),
                  Text(
                    " , ستحصل عليه في خلال بضع دقائ \nشكرا علي الطلب .. ستحصل عليه في خلال بضع دقائق ",
                    style: isPortrait
                        ? AppTextStyles.font12greyw200
                            .copyWith(color: Colors.white)
                        : AppTextStyles.font8greyw200
                            .copyWith(color: Colors.white, fontSize: 5.sp),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: isPortrait ? 36.r : shortSide / 6),
                    child: TextAndColoredButton(
                        height: isPortrait ? shortSide / 7 : shortSide / 8,
                        title: "ترتيب المسار",
                        onTap: () {
                          context.pushNamed(Routes.trackOrderScreen);
                        },
                        width: screenWidth,
                        color: const Color.fromARGB(255, 19, 19, 31)
                            .withOpacity(.83)),
                  ),
                  verticalSpace(isPortrait ? 16 : 6)
                ],
              ),
            ),
          ),
          verticalSpace(24.h)
        ],
      ),
    );
  }

  Padding buildTabletLayout(bool isPortrait, double screenWidth,
      double shortSide, double screenHeight, BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: isPortrait ? shortSide / 8.r : 65.w, vertical: 16.r),
      child: Column(
        children: [
          CustomAppBar(
              title: "عربة التسوق",
              textStyle: isPortrait
                  ? AppTextStyles.font18BlackW300
                  : AppTextStyles.font12BlackW300),
          verticalSpace(isPortrait ? 48 : 32),
          Expanded(
            child: Container(
              margin: EdgeInsetsDirectional.symmetric(
                  horizontal: isPortrait ? 12.r : shortSide / 5,
                  vertical: !isPortrait ? shortSide / 13 : shortSide / 6),
              width: screenWidth,
              decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadiusDirectional.circular(16.r)),
              child: Column(
                children: [
                  const Spacer(
                    flex: 4,
                  ),
                  Image.asset(
                    "assets/images/success_bag_icon.png",
                    //color: AppColors.redColor,
                    width: isPortrait ? shortSide / 3 : shortSide / 3,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    "طلبك ناجح !",
                    style: isPortrait
                        ? AppTextStyles.font24WhiteBold
                            .copyWith(color: Colors.white, fontSize: 28.sp)
                        : AppTextStyles.font30WhiteBold
                            .copyWith(color: Colors.white),
                  ),
                  verticalSpace(isPortrait ? 8 : 2),
                  Text(
                    " , ستحصل عليه في خلال بضع دقائ \nشكرا علي الطلب .. ستحصل عليه في خلال بضع دقائق ",
                    style: isPortrait
                        ? AppTextStyles.font20greyw200
                            .copyWith(color: Colors.white)
                        : AppTextStyles.font8greyw200
                            .copyWith(color: Colors.white, fontSize: 22.sp),
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal:
                            isPortrait ? shortSide / 10.r : shortSide / 6),
                    child: TextAndColoredButton(
                        height: isPortrait ? shortSide / 10 : shortSide / 12,
                        title: "ترتيب المسار",
                        onTap: () {
                          context.pushNamed(Routes.trackOrderScreen);
                        },
                        width: screenWidth,
                        color: const Color.fromARGB(255, 19, 19, 31)
                            .withOpacity(.83)),
                  ),
                  verticalSpace(isPortrait ? 24 : 16)
                ],
              ),
            ),
          ),
          verticalSpace(24.h)
        ],
      ),
    );
  }
}
