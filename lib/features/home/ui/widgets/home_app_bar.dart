import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/custom_icon_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return isPortrait
        ? buildPortraitLayout(context, isTablet)
        : buildLandScapeLayout(context, isTablet);
  }

  Padding buildPortraitLayout(BuildContext context, bool isTablet) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.profileScreen);
            },
            child: CircleAvatar(
              radius: isTablet ? 50.w : 25.w,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: isTablet ? 48.w : 23.w,
                backgroundImage: const AssetImage('assets/images/person.jpg'),
              ),
            ),
          ),
          horizontalSpace(6),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "محمود علاء",
                style: isTablet
                    ? AppTextStyles.font26BlackBold
                    : AppTextStyles.font12BlackW300,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: AppColors.redColor,
                  ),
                  horizontalSpace(4),
                  Text(
                    "المنوفية - شبين الكوم",
                    style: isTablet
                        ? AppTextStyles.font16greyw200
                        : AppTextStyles.font8greyw200,
                  )
                ],
              )
            ],
          ),
          const Spacer(),
          CustomIconButton(
            icon: Icons.camera_alt_outlined,
            iconSize: isTablet ? 50.w : 25.w,
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  buildLandScapeLayout(BuildContext context, bool isTablet) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.profileScreen);
            },
            child: CircleAvatar(
              radius: isTablet ? 30.w : 17.w,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: isTablet ? 28.w : 15.w,
                backgroundImage: const AssetImage('assets/images/person.jpg'),
              ),
            ),
          ),
          horizontalSpace(isTablet ? 6 : 2),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "محمود علاء",
                style: isTablet
                    ? AppTextStyles.font26BlackBold
                    : AppTextStyles.font10BlackW300,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: AppColors.redColor,
                  ),
                  horizontalSpace(4),
                  Text(
                    "المنوفية - شبين الكوم",
                    style: isTablet
                        ? AppTextStyles.font16greyw200
                        : AppTextStyles.font8greyw200.copyWith(fontSize: 6.sp),
                  )
                ],
              )
            ],
          ),
          const Spacer(),
          CustomIconButton(
            icon: Icons.camera_alt_outlined,
            iconSize: isTablet ? 45.w : 20.w,
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
