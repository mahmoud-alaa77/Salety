import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/widgets/custom_icon_button.dart';
import 'package:task1intern/features/profile/ui/widgets/custom_colored_button.dart';
import 'package:task1intern/features/profile/ui/widgets/custom_white_button.dart';
import 'package:task1intern/features/profile/ui/widgets/image_and_name_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: ProfileScreenBody(),
    ));
  }
}

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;
    double screenWidth = MediaQuery.sizeOf(context).width;
    //double screenHeight = MediaQuery.sizeOf(context).height;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal:
            orientation == Orientation.portrait ? 32.r : screenWidth / 5,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  icon: Icons.camera_alt_outlined,
                  iconSize: isTablet ? 65.w : 45.w,
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                ),
                CustomIconButton(
                  color: Colors.white,
                  icon: Icons.arrow_forward_ios,
                  iconSize: isTablet ? 65.w : 45.w,
                  borderRadius: BorderRadius.circular(12.r),
                  onTap: () {
                    context.pop();
                  },
                ),
              ],
            ),
            ImageAndNameSection(
              isTablet: isTablet,
            ),
            verticalSpace(isTablet ? 36 : 24),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: isTablet ? 24 : 12,
                mainAxisSpacing: isTablet ? 24 : 12,
                childAspectRatio: 1,
              ),
              children: [
                CustomWhiteButton(
                  icon: Icons.money,
                  isTablet: isTablet,
                  text: "مدفوعاتي",
                ),
                CustomWhiteButton(
                  icon: Icons.notifications,
                  isTablet: isTablet,
                  text: "اشعاراتي",
                  onTap: () {
                    context.pushNamed(Routes.notificationsScreen);
                  },
                ),
                CustomWhiteButton(
                  icon: Icons.account_balance_wallet,
                  isTablet: isTablet,
                  text: "حسابي",
                ),
                CustomWhiteButton(
                  icon: Icons.add_chart_sharp,
                  isTablet: isTablet,
                  text: "المعاملات",
                ),
                CustomWhiteButton(
                  icon: Icons.settings,
                  isTablet: isTablet,
                  text: "الاعدادات",
                ),
                CustomWhiteButton(
                  icon: Icons.help_outline,
                  isTablet: isTablet,
                  text: "مساعدة",
                ),
                CustomWhiteButton(
                  icon: Icons.location_on,
                  isTablet: isTablet,
                  text: "عنواني",
                ),
                CustomWhiteButton(
                  icon: Icons.settings,
                  isTablet: isTablet,
                  text: "المفضلة",
                ),
                CustomWhiteButton(
                  icon: Icons.shopping_basket_sharp,
                  isTablet: isTablet,
                  text: "طلباتي",
                ),
              ],
            ),
            verticalSpace(isTablet ? 36 : 24),
            Row(
              children: [
                CustomColoredButton(
                    isTablet: isTablet,
                    icon: Icons.exit_to_app_outlined,
                    text: "خروج",
                    color: AppColors.greenColor),
                CustomColoredButton(
                    isTablet: isTablet,
                    icon: Icons.connect_without_contact_rounded,
                    text: "مركز الدعم",
                    color: AppColors.redColor),
              ],
            )
          ],
        ),
      ),
    );
  }
}
