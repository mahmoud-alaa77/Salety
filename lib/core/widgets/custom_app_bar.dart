import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/widgets/custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final TextStyle textStyle;
  const CustomAppBar({super.key, required this.title, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          icon: Icons.camera_alt_outlined,
          iconSize: isTablet
              ? 55.w
              : !isTablet && orientation == Orientation.portrait
                  ? 35.w
                  : 20.w,
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
        ),
        Text(
          title,
          style: textStyle,
        ),
        CustomIconButton(
          icon: Icons.arrow_forward_ios,
          iconSize: isTablet
              ? 55.w
              : !isTablet && orientation == Orientation.portrait
                  ? 35.w
                  : 20.w,
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
          onTap: () {
            context.pop();
          },
        ),
      ],
    );
  }
}
