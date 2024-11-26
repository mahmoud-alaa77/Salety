import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  final bool active;
  final Color color;
  const CustomIndicator({super.key, required this.active, required this.color});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return AnimatedContainer(
      width: active ? screenWidth * 0.04 : screenWidth * .02,
      height: screenHeight * .01,
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(50),
          color: active ? color : Colors.grey),
    );
  }
}
