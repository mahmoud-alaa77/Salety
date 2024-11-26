import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestValuesList extends StatelessWidget {
  final bool isTablet;
  const BestValuesList({super.key, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return isPortrait ? buildPortraitLayout() : buildLandScapeLayout();
  }

  SizedBox buildPortraitLayout() {
    return SizedBox(
      width: double.infinity,
      height: isTablet ? 220.h : 130.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin:
                EdgeInsetsDirectional.symmetric(horizontal: index == 0 ? 0 : 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: SizedBox(
                width: isTablet ? 400.w : 280.w,
                height: isTablet ? 200.h : 120.h,
                child: Image.asset(
                  "assets/images/fruits_category.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox buildLandScapeLayout() {
    return SizedBox(
      width: double.infinity,
      height: isTablet ? 220.h : 170.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin:
                EdgeInsetsDirectional.symmetric(horizontal: index == 0 ? 0 : 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: SizedBox(
                width: isTablet ? 450.w : 180.w,
                height: isTablet ? 215.h : 160.h,
                child: Image.asset(
                  "assets/images/fruits_category.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
