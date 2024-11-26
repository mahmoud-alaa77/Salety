import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/spacing.dart';

class OnBoardingScreenBody extends StatelessWidget {
  final Color color;
  final String image;
  final String title;
  final String subTitle;
  const OnBoardingScreenBody(
      {super.key,
      required this.color,
      required this.image,
      required this.title,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Spacer(
            flex: 3,
          ),
          // orientation == Orientation.portrait
          //     ? verticalSpace(16)
          //     : verticalSpace(0),
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: SizedBox(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircleAvatar(
                    backgroundColor: color.withOpacity(.2),
                    radius: orientation == Orientation.portrait
                        ? screenWidth / 2.8
                        : screenHeight / 4,
                  ),
                  CircleAvatar(
                    backgroundColor: color.withOpacity(.5),
                    radius: orientation == Orientation.portrait
                        ? screenWidth / 3.2
                        : screenHeight / 4.7,
                  ),
                  CircleAvatar(
                    backgroundColor: color,
                    radius: orientation == Orientation.portrait
                        ? screenWidth / 4
                        : screenHeight / 5.5,
                    child: ScaleTransition(
                      scale: const AlwaysStoppedAnimation(.6),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(
            flex: 3,
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: isTablet &&
                          (orientation == Orientation.portrait ||
                              orientation == Orientation.landscape)
                      ? 32.sp
                      : !isTablet && orientation == Orientation.landscape
                          ? 12.sp
                          : 22.sp,
                  color: color,
                  fontWeight: FontWeight.bold),
            ),
          ),
          orientation == Orientation.portrait
              ? verticalSpace(16)
              : verticalSpace(4),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              subTitle,
              style: TextStyle(
                fontSize: isTablet &&
                        (orientation == Orientation.portrait ||
                            orientation == Orientation.landscape)
                    ? 24.sp
                    : !isTablet && orientation == Orientation.landscape
                        ? 8.sp
                        : 16.sp,
                fontWeight: FontWeight.w100,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
