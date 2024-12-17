import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/app_text_form_field.dart';
import 'package:task1intern/core/widgets/custom_icon_button.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Row(
      children: [
        CustomIconButton(
          icon: Icons.tune,
          iconSize: isTablet
              ? 50.w
              : isPortrait && !isTablet
                  ? 48.w
                  : 26.w,
          color: AppColors.redColor,
          borderRadius: BorderRadius.circular(16.r),
          iconColor: Colors.white,
          padding: EdgeInsets.all(12.r),
        ),
        Expanded(
            child: AppTextFormField(
          validator: (val) {
            if (val!.isEmpty) {
              return "حقل البريد الالكتروني مطلوب";
            }
            return null;
          },
          hint: "البحث عن المنتجات...",
          hintStyle: isTablet
              ? AppTextStyles.font16greyw200
              : AppTextStyles.font12greyw200,
          suffixIcon: const Icon(Icons.search),
          prefixIcon: Icon(
            Icons.close,
            size: isTablet ? 30.w : 20.w,
          ),
          contentPadding: const EdgeInsets.all(14),
        ))
      ],
    );
  }
}
