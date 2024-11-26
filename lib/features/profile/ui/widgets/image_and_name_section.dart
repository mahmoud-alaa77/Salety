import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';

class ImageAndNameSection extends StatelessWidget {
  final bool isTablet;
  const ImageAndNameSection({super.key, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return SizedBox(
      width: double.infinity,
      height: getGreenContainerHeight(orientation,isTablet),
      child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        Container(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 20.r,
            vertical: 16.r,
          ),
               height: getGreenContainerHeight(orientation,isTablet)-80,

          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.w),
              color: AppColors.greenColor),
        ),
        Positioned(
          top: 0.h,
          child: Align(
              alignment: AlignmentDirectional.topCenter,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: isTablet
                        ? 120.w
                        : (!isTablet && orientation == Orientation.portrait)
                            ? 68.w
                            : 35.w,
                    backgroundColor: Colors.white.withOpacity(.3),
                    child: CircleAvatar(
                      radius: isTablet
                          ? 100.w
                          : (!isTablet && orientation == Orientation.portrait)
                              ? 58.w
                              : 35.w,
                      backgroundImage:
                          const AssetImage("assets/images/person.jpg"),
                    ),
                  ),
                  verticalSpace(isTablet ? 12 : 2),
                  Text(
                    'Mahmoud Alaa',
                    style: isTablet
                        ? AppTextStyles.font30WhiteBold
                        : AppTextStyles.font18WhiteBold,
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(isTablet ? 12 : 0),
                  Text(
                    'mahmoud.alaa1612@gmail.com',
                    style: isTablet
                        ? AppTextStyles.font14greyw200.copyWith(
                            fontSize: 24.sp,
                            color: Colors.white.withOpacity(.7))
                        : AppTextStyles.font24WhiteBold.copyWith(
                            fontSize: 12.sp,
                            color: Colors.white.withOpacity(.7)),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
        )
      ]),
    );
  }
}


double getGreenContainerHeight(Orientation orientation, bool isTablet) {
  if (orientation == Orientation.portrait && isTablet) {
    return 400.h;
  } else if (orientation == Orientation.portrait && !isTablet) {
    return 220.h;
  } else if (orientation == Orientation.landscape && isTablet) {
    return 400.h;
  } else {
    return 350.h;
  }
}
/*
SizedBox(
      width:MediaQuery.sizeOf(context).width,
      height: isTablet ? 400.h : 250.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            child: Container(
      width:MediaQuery.sizeOf(context).width,
              height: 350.h,
              color: Colors.transparent,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
      width:MediaQuery.sizeOf(context).width,
              height:isTablet ? 
              300.h: 180.h,
              decoration: BoxDecoration(
                              color: AppColors.greenColor,
borderRadius: BorderRadiusDirectional.circular(16.r)
              ),
            ),
          ),
        ],
      ),
    );

*/