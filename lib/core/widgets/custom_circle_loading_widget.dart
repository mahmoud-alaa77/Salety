import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomCircleLoadingWidget extends StatelessWidget {
  final double height;
  final double width;
  const CustomCircleLoadingWidget(
      {super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: Container(
          height: height,
          width: width,
          margin: EdgeInsetsDirectional.symmetric(horizontal: 8),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white),
        ));
  }
}
