import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeImageContainer extends StatelessWidget {
  final bool isTablet;
  const HomeImageContainer({
    super.key,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return isPortrait ? buildportraitLayout() : buildLandScapeLayout();
  }

  Padding buildportraitLayout() {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
      child: SizedBox(
        width: double.infinity,
        height: isTablet ? 250.h : 175.h,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/images/fruits_img.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  buildLandScapeLayout() {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
      child: SizedBox(
        width: double.infinity,
        height: isTablet ? 300.h : 210.h,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/images/fruits_img.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
