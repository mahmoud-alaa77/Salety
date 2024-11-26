import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/text_and_colored_buton.dart';
import 'package:task1intern/core/widgets/custom_app_bar.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

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
              title: "الدفع", textStyle: AppTextStyles.font18BlackW300),
          verticalSpace(isPortrait ? 32 : 16),
          Expanded(
            child: Container(
              margin: EdgeInsetsDirectional.symmetric(
                  horizontal: isPortrait ? 12.r : shortSide / 3,
                  vertical: !isPortrait ? 0 : shortSide / 4.5),
              width: screenWidth,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(16.r)),
              child: Column(
                children: [
                  const Spacer(
                    flex: 4,
                  ),
                  Image.asset(
                    "assets/images/bag_icon.png",
                    color: AppColors.redColor,
                    width: isPortrait ? shortSide / 4.2 : shortSide / 4.6,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    "سلة المشتريات فارغة",
                    style: isPortrait
                        ? AppTextStyles.font20BlackW400
                        : AppTextStyles.font14BlackW300,
                  ),
                  verticalSpace(isPortrait ? 8 : 0),
                  Text(
                    "اجعل سلتك سعيدة واضف منتجات",
                    style: isPortrait
                        ? AppTextStyles.font16greyw200
                        : AppTextStyles.font8greyw200,
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 36.r),
                    child: TextAndColoredButton(
                        height: isPortrait ? shortSide / 7 : shortSide / 8,
                        title: "ابدأ التسوق",
                        onTap: () {
                          context.pushNamed(Routes.orderAddressScreen);
                        },
                        width: screenWidth,
                        color: AppColors.greenColor),
                  ),
                  verticalSpace(16)
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

Padding buildTabletLayout(bool isPortrait, double screenWidth, double shortSide,
    double screenHeight, BuildContext context) {
  return Padding(
    padding: EdgeInsetsDirectional.symmetric(
        horizontal: isPortrait ? 36.r : shortSide / 6, vertical: 24.r),
    child: Column(
      children: [
        CustomAppBar(title: "الدفع", textStyle: AppTextStyles.font26BlackBold),
        verticalSpace(isPortrait ? 32 : 16),
        Expanded(
          child: Container(
            margin: EdgeInsetsDirectional.symmetric(
                horizontal: isPortrait ? 24.r : shortSide / 6,
                vertical: isPortrait ? shortSide / 10 : shortSide / 15),
            width: screenWidth,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(16.r)),
            child: Column(
              children: [
                const Spacer(
                  flex: 4,
                ),
                Image.asset(
                  "assets/images/bag_icon.png",
                  color: AppColors.redColor,
                  width: isPortrait ? shortSide / 4.2 : shortSide / 4.6,
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  "سلة المشتريات فارغة",
                  style: AppTextStyles.font22BlackBold,
                ),
                verticalSpace(8),
                Text(
                  "اجعل سلتك سعيدة واضف منتجات",
                  style: AppTextStyles.font16greyw200
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 4,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: shortSide / 10),
                  child: TextAndColoredButton(
                      height: isPortrait ? shortSide / 10 : shortSide / 12,
                      title: "ابدأ التسوق",
                      onTap: () {
                        context.pushNamed(Routes.orderAddressScreen);
                      },
                      width: screenWidth,
                      color: AppColors.greenColor),
                ),
                verticalSpace(36)
              ],
            ),
          ),
        ),
        verticalSpace(24.h)
      ],
    ),
  );
}
