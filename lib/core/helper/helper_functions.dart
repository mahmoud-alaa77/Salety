import 'package:flutter/material.dart';

class HelperFunctions {
  double getResponsiveFontSize(BuildContext context,
      {required double fontSize}) {
    double scaleFactor = getScaleFactor(context);
    double responsiveFontSize = scaleFactor * fontSize;
    return responsiveFontSize.clamp(fontSize * .8, fontSize * 1.4);
  }

  double getScaleFactor(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    bool phonePortrit = screenWidth <= 600;
    bool phoneLandScape =
        screenWidth >= 600 && screenWidth < 960 && screenWidth > screenHeight;
    bool tabletPortrait =
        screenWidth >= 600 && screenWidth < 960 && screenHeight > screenWidth;
    //bool tabletLandScape = screenWidth > 960;

    if (phonePortrit) {
      return screenWidth / 400;
    } else if (tabletPortrait) {
      return screenWidth / 800;
    } else if (phoneLandScape) {
      return screenWidth / 750;
    } else {
      return screenWidth / 1450;
    }
  }

  /// Calculates responsive width based on screen width and device type.
  double getResponsiveWidth(BuildContext context, {required double width}) {
    double scaleFactor = getScaleFactor(context);
    double responsiveWidth = scaleFactor * width;
    return responsiveWidth.clamp(width * 0.8, width * 1.2);
  }

  /// Calculates responsive height based on screen width and device type.
  double getResponsiveHeight(BuildContext context, {required double height}) {
    double scaleFactor = getScaleFactor(context);
    double responsiveHeight = scaleFactor * height;
    return responsiveHeight.clamp(height * 0.8, height * 1.2);
  }
}
