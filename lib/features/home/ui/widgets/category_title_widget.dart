import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';

class CategoryTitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function()? onTap;
  const CategoryTitleWidget(
      {super.key, required this.title, required this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;

    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
      child: Row(
        children: [
          Text(
            title,
            style: isTablet
                ? AppTextStyles.font26BlackBold
                : AppTextStyles.font18BlackW300,
          ),
          horizontalSpace(4),
          Text(subtitle,
              style: isTablet
                  ? AppTextStyles.font20greyw200
                  : AppTextStyles.font12greyw200),
          const Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  "مشاهدة الكل",
                  style: isTablet
                      ? AppTextStyles.font20greyw200
                      : AppTextStyles.font12greyw200,
                ),
                horizontalSpace(2),
                Icon(
                  Icons.send,
                  color: AppColors.greyColor,
                  size: isTablet ? 25.w : 15.w,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
