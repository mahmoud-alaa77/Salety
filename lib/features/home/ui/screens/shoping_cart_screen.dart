import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/text_and_colored_buton.dart';
import 'package:task1intern/core/widgets/custom_app_bar.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: OrientationBuilder(builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return buildPortraitLayout(
                  isTablet, isPortrait, screenWidth, screenHeight, context);
            } else {
              return buildLandScapeLayout(
                  isTablet, isPortrait, screenWidth, screenHeight, context);
            }
          })),
    );
  }

  Column buildPortraitLayout(bool isTablet, bool isPortrait, double screenWidth,
      double screenHeight, BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: isTablet ? 16.r : 8.r, vertical: 16.r),
            child: CustomAppBar(
                title: "عربة التسوق",
                textStyle: isTablet
                    ? AppTextStyles.font26BlackBold
                    : AppTextStyles.font18BlackW300)),
        verticalSpace(isTablet ? 24 : 16),
        Expanded(
            child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(
                  horizontal: isTablet ? 125.r : 20.r, vertical: 10.r),
              padding: EdgeInsetsDirectional.symmetric(
                  vertical: 4.r, horizontal: 12.r),
              width: screenWidth,
              height: screenHeight / 6.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(12.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.minimize,
                          size: isTablet ? 45.w : 28.w,
                        ),
                        Text(
                          "2",
                          style: isTablet
                              ? AppTextStyles.font24BlackBold
                              : AppTextStyles.font18BlackW300,
                        ),
                        Icon(
                          Icons.add,
                          size: isTablet ? 45.w : 28.w,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "2 * 100 \$",
                          style: TextStyle(
                              color: AppColors.greenColor,
                              fontSize: isTablet ? 30.sp : 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "كمثري امريكي",
                          style: isTablet
                              ? AppTextStyles.font26BlackBold
                              : AppTextStyles.font18BlackW300,
                        ),
                        verticalSpace(isTablet ? 10 : 4),
                        Text(
                          "2 Kg",
                          style: isTablet
                              ? AppTextStyles.font20greyw200
                              : AppTextStyles.font16greyw200,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        )),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: isTablet ? 125.r : 20.r, vertical: 10.r),
          padding: EdgeInsetsDirectional.all(isTablet ? 26.r : 16.r),
          width: screenWidth,
          height: isTablet ? screenHeight / 6 : screenHeight / 5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadiusDirectional.circular(12.r),
          ),
          child: Column(
            children: [
              buildTextRow(
                  "البنود",
                  "4",
                  isTablet
                      ? AppTextStyles.font16greyw200
                      : AppTextStyles.font12greyw200),
              verticalSpace(4),
              buildTextRow(
                  "المجموع الفرعي",
                  "100.00 \$",
                  isTablet
                      ? AppTextStyles.font16greyw200
                      : AppTextStyles.font12greyw200),
              verticalSpace(4),
              buildTextRow(
                  "رسوم التوصيل",
                  "Free",
                  isTablet
                      ? AppTextStyles.font16greyw200
                      : AppTextStyles.font12greyw200),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("الاجمالي",
                      style: isTablet
                          ? AppTextStyles.font24BlackBold
                          : AppTextStyles.font14BlackW300),
                  Text("  SAR 100.00",
                      style: isTablet
                          ? AppTextStyles.font24BlackBold
                          : AppTextStyles.font12BlackW300
                              .copyWith(fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
        ),
        verticalSpace(isTablet ? 16 : 8),
        Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: isTablet ? 125.r : 20.r),
            child: TextAndColoredButton(
                onTap: () {
                  context.pushNamed(Routes.paymentScrren);
                },
                height: isTablet ? screenHeight / 20 : screenHeight / 15,
                title: "الدفع",
                width: screenWidth,
                fontSize: isTablet ? 28.sp : 20.sp,
                color: AppColors.greenColor)),
        verticalSpace(isTablet ? 24 : 12),
      ],
    );
  }

  Padding buildLandScapeLayout(bool isTablet, bool isPortrait,
      double screenWidth, double screenHeight, BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: isTablet ? 120.r : 24.r, vertical: 16.r),
      child: Column(
        children: [
          CustomAppBar(
              title: "عربة التسوق",
              textStyle: isTablet
                  ? AppTextStyles.font26BlackBold
                  : AppTextStyles.font12BlackW300),
          verticalSpace(isTablet ? 24 : 16),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: screenWidth / 1.8,
                  child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: isTablet ? 26.r : 4.r, vertical: 10.r),
                        padding: EdgeInsetsDirectional.symmetric(
                            vertical: 4.r, horizontal: 12.r),
                        height: screenHeight / 3.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.circular(
                              isTablet ? 24.r : 16.r),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.minimize,
                                    size: isTablet ? 30.w : 10.w,
                                  ),
                                  Text(
                                    "2",
                                    style: isTablet
                                        ? AppTextStyles.font18BlackW300
                                        : AppTextStyles.font10BlackW300,
                                  ),
                                  Icon(
                                    Icons.add,
                                    size: isTablet ? 30.w : 15.w,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "2 * 100 \$",
                                    style: TextStyle(
                                        color: AppColors.greenColor,
                                        fontSize: isTablet ? 20.sp : 10.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "كمثري امريكي",
                                    style: isTablet
                                        ? AppTextStyles.font18BlackW300
                                        : AppTextStyles.font10BlackW300,
                                  ),
                                  verticalSpace(isTablet ? 10 : 4),
                                  Text(
                                    "2 Kg",
                                    style: isTablet
                                        ? AppTextStyles.font12greyw200
                                        : AppTextStyles.font8greyw200,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: isTablet ? 26.r : 8.r, vertical: 10.r),
                        padding:
                            EdgeInsetsDirectional.all(isTablet ? 26.r : 16.r),
                        width: screenWidth,
                        height: screenHeight / 2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.circular(12.r),
                        ),
                        child: Column(
                          children: [
                            buildTextRow(
                                "البنود",
                                "4",
                                isTablet
                                    ? AppTextStyles.font16greyw200
                                    : AppTextStyles.font8greyw200),
                            verticalSpace(4),
                            buildTextRow(
                                "المجموع الفرعي",
                                "100.00 \$",
                                isTablet
                                    ? AppTextStyles.font16greyw200
                                    : AppTextStyles.font8greyw200),
                            verticalSpace(4),
                            buildTextRow(
                                "رسوم التوصيل",
                                "Free",
                                isTablet
                                    ? AppTextStyles.font16greyw200
                                    : AppTextStyles.font8greyw200),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("الاجمالي",
                                    style: isTablet
                                        ? AppTextStyles.font12BlackW300
                                        : AppTextStyles.font8BlackW300),
                                Text("  SAR 100.00",
                                    style: isTablet
                                        ? AppTextStyles.font12BlackW300
                                        : AppTextStyles.font8BlackW300.copyWith(
                                            fontWeight: FontWeight.bold)),
                              ],
                            )
                          ],
                        ),
                      ),
                      verticalSpace(isTablet ? 16 : 0),
                      Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                              horizontal: isTablet ? 26.r : 8.r),
                          child: TextAndColoredButton(
                              onTap: () {
                                context.pushNamed(Routes.paymentScrren);
                              },
                              height: isTablet
                                  ? screenHeight / 14
                                  : screenHeight / 8,
                              title: "الدفع",
                              width: screenWidth,
                              fontSize: isTablet ? 18.sp : 12.sp,
                              color: AppColors.greenColor)),
                      verticalSpace(isTablet ? 16 : 0)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Row buildTextRow(String value, String key, TextStyle style) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(value, style: style),
        Text(key, style: style),
      ],
    );
  }
}
