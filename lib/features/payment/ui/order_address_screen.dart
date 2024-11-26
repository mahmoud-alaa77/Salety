import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/custom_app_bar.dart';
import 'package:task1intern/core/widgets/text_and_colored_buton.dart';

class OrderAddressScreen extends StatelessWidget {
  const OrderAddressScreen({super.key});

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
          body: LayoutBuilder(
            builder: (context, constraints) {
              return isTablet
                  ? buildTabletLayout(
                      isPortrait, screenWidth, shortSide, screenHeight, context)
                  : buildMobileLayout(isPortrait, screenWidth, shortSide,
                      screenHeight, context);
            },
          )),
    );
  }

  buildMobileLayout(bool isPortrait, double screenWidth, double shortSide,
      double screenHeight, BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: isPortrait ? 16.r : shortSide / 6, vertical: 8.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            title: "عنوان التسليم",
            textStyle: AppTextStyles.font18BlackW300,
          ),
          verticalSpace(isPortrait ? 32 : 0),
          Text(
            "يشحن الي ",
            style: AppTextStyles.font16greyw200,
          ),
          verticalSpace(isPortrait ? 32 : 12),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 8.r, vertical: 12.r),
                  margin: EdgeInsetsDirectional.symmetric(
                      horizontal: isPortrait ? 12.r : shortSide / 3,
                      vertical: 8.r),
                  width: screenWidth,
                  // height: isPortrait ? screenHeight / 5 : screenHeight / 2.7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(16.r)),
                  child: Column(
                    children: [
                      index == 0
                          ? const Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                "افتراضي",
                                style: TextStyle(
                                    color: AppColors.greenColor,
                                    fontWeight: FontWeight.bold),
                              ))
                          : const SizedBox.shrink(),
                      Row(
                        children: [
                          Radio(
                            groupValue: true,
                            value: true,
                            onChanged: (val) {},
                            fillColor: const WidgetStatePropertyAll(
                                AppColors.redColor),
                          ),
                          Text(
                            "المنزل",
                            style: AppTextStyles.font14BlackW300
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          const Icon(Icons.more_horiz),
                          horizontalSpace(isPortrait ? 8 : 2),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.symmetric(horizontal: 12.r),
                          child: Text(
                            "A/34,King plazza , shinen elkom ,Monofia\nshinen elkom ,Monofia",
                            style: AppTextStyles.font14greyw200,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      verticalSpace(isPortrait ? 12 : 6),
                      Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "جوال :01007035909",
                            style: AppTextStyles.font14BlackW300,
                          )),
                    ],
                  ),
                );
              },
            ),
          ),
          verticalSpace(24.h),
          TextAndColoredButton(
              height: isPortrait ? screenHeight / 15 : screenHeight / 9,
              title: "التسليم لهذا العنوان",
              margin: EdgeInsets.symmetric(
                  horizontal: isPortrait ? 12.r : screenWidth / 6),
              width: screenWidth,
              onTap: () {
                context.pushNamed(Routes.successOrderScreen);
              },
              color: AppColors.greenColor),
          verticalSpace(12),
        ],
      ),
    );
  }

  buildTabletLayout(bool isPortrait, double screenWidth, double shortSide,
      double screenHeight, BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: isPortrait ? 24.r : shortSide / 6, vertical: 8.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            title: "عنوان التسليم",
            textStyle: AppTextStyles.font20BlackW400,
          ),
          verticalSpace(isPortrait ? 32 : 0),
          Text(
            "يشحن الي ",
            style: AppTextStyles.font20greyw200,
          ),
          verticalSpace(isPortrait ? 32 : 12),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 8.r, vertical: 16.r),
                  margin: EdgeInsetsDirectional.symmetric(
                      horizontal: isPortrait ? 12.r : shortSide / 6,
                      vertical: 12.r),
                  width: screenWidth,
                  //height: isPortrait ? screenHeight / 5.5 : screenHeight / 3.5,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(16.r)),
                  child: Column(
                    children: [
                      index == 0
                          ? Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                "افتراضي",
                                style: TextStyle(
                                    color: AppColors.greenColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp),
                              ))
                          : const SizedBox.shrink(),
                      verticalSpace(isPortrait ? 12 : 6),
                      Row(
                        children: [
                          Radio(
                            groupValue: true,
                            value: true,
                            onChanged: (val) {},
                            fillColor: const WidgetStatePropertyAll(
                                AppColors.redColor),
                          ),
                          Text(
                            "المنزل",
                            style: AppTextStyles.font20BlackW400
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          const Icon(Icons.more_horiz),
                          horizontalSpace(isPortrait ? 12 : 6),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.symmetric(horizontal: 12.r),
                          child: Text(
                            "A/34,King plazza , shinen elkom ,Monofia\nshinen elkom ,Monofia",
                            style: AppTextStyles.font16greyw200,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      verticalSpace(isPortrait ? 12 : 6),
                      Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            "جوال :01007035909",
                            style: AppTextStyles.font18BlackW300,
                          )),
                    ],
                  ),
                );
              },
            ),
          ),
          verticalSpace(24.h),
          TextAndColoredButton(
              height: isPortrait ? screenHeight / 15 : screenHeight / 9,
              title: "التسليم لهذا العنوان",
              margin: EdgeInsets.symmetric(
                  horizontal: isPortrait ? 12.r : screenWidth / 6),
              width: screenWidth,
              onTap: () {
                context.pushNamed(Routes.successOrderScreen);
              },
              color: AppColors.greenColor),
          verticalSpace(16),
        ],
      ),
    );
  }
}
