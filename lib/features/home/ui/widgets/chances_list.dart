import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';

class ChancesList extends StatelessWidget {
  const ChancesList({super.key});

  @override
  Widget build(BuildContext context) {
    double shortSide = MediaQuery.sizeOf(context).shortestSide;
    double longestSide = MediaQuery.sizeOf(context).longestSide;
    bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return isPortrait
        ? buildPortraitLayout(context, longestSide, isTablet, shortSide)
        : buildLandScapeLayout(context, longestSide, isTablet, shortSide);
  }

  SizedBox buildPortraitLayout(BuildContext context, double longestSide,
      bool isTablet, double shortSide) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: longestSide / 4.2,
      child: ListView.builder(
        itemCount: 10,
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: 16.r, vertical: 4.r),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio: .7,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                margin: EdgeInsets.all(isTablet ? 12.r : 4.r),
                width: shortSide / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                          vertical: 4.r, horizontal: 4.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "طبق فواكه",
                            style: isTablet
                                ? AppTextStyles.font20greyw200
                                : AppTextStyles.font10greyw200,
                          ),
                          Text("خصم 25% بدون فوائد",
                              style: isTablet
                                  ? AppTextStyles.font20BlackW400
                                  : AppTextStyles.font12BlackW300),
                          verticalSpace(isTablet ? 8 : 4),
                          Image.asset("assets/images/fruits.png"),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Container(
                        height: isTablet ? 60.h : 35.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(12.r),
                            bottomStart: Radius.circular(12.r),
                          ),
                          color: Colors.grey.withOpacity(.5),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: isTablet ? 30.h : 16.h,
                        right: isTablet ? 20.w : 15.w,
                        child: CircleAvatar(
                          backgroundColor: AppColors.redColor,
                          radius: isTablet ? 30.r : 15.r,
                          child: Icon(
                            Icons.arrow_back_ios_sharp,
                            color: Colors.white,
                            size: isTablet ? 20.w : 15.w,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  buildLandScapeLayout(BuildContext context, double longestSide, bool isTablet,
      double shortSide) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: longestSide / 4.2,
      child: ListView.builder(
        itemCount: 10,
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: 16.r, vertical: 4.r),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio: .8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                margin: EdgeInsets.all(isTablet ? 12.r : 4.r),
                width: shortSide / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                          vertical: 4.r, horizontal: 4.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "طبق فواكه",
                            style: isTablet
                                ? AppTextStyles.font12greyw200
                                : AppTextStyles.font10greyw200.copyWith(fontSize: 7.sp),
                          ),
                          Text("خصم 25% بدون فوائد",
                              style: isTablet
                                  ? AppTextStyles.font20BlackW400
                                  : AppTextStyles.font12BlackW300.copyWith(fontSize: 6.sp)),
                          verticalSpace(isTablet ? 8 : 4),
                          Image.asset("assets/images/fruits.png",fit: BoxFit.cover,),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Container(
                        height: isTablet ? 60.h : 35.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(
                            bottomEnd: Radius.circular(12.r),
                            bottomStart: Radius.circular(12.r),
                          ),
                          color: Colors.grey.withOpacity(.5),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: isTablet ? 30.h : 16.h,
                        right: isTablet ? 20.w : 15.w,
                        child: CircleAvatar(
                          backgroundColor: AppColors.redColor,
                          radius: isTablet ? 30.r : 15.r,
                          child: Icon(
                            Icons.arrow_back_ios_sharp,
                            color: Colors.white,
                            size: isTablet ? 20.w : 8.w,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
