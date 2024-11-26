import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/spacing.dart';

class OffersListView extends StatelessWidget {
  final bool isTablet;

  const OffersListView({
    super.key,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SizedBox(
        width: double.infinity,
        height: isTablet && isPortrait
            ? 450.h
            : isPortrait
                ? 260.h
                : 375.h,
        child: GridView.builder(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
          itemCount: 16,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1),
          itemBuilder: (context, index) {
            return OfferItemCard(
                firstLine: index % 2 == 0 ? "اقل" : "صفقة",
                isTablet: isTablet,
                hasThreeLines: index % 2 == 0 ? false : true,
                secondLine: "40 %",
                thirdLine: index % 2 == 0 ? "99 SAR" : "خصم",
                cardColor: cardColors[index]);
          },
        ));
  }
}

class OfferItemCard extends StatelessWidget {
  const OfferItemCard({
    super.key,
    required this.firstLine,
    required this.isTablet,
    required this.hasThreeLines,
    required this.secondLine,
    required this.thirdLine,
    required this.cardColor,
  });

  final String firstLine;
  final bool isTablet;
  final bool hasThreeLines;
  final String? secondLine;
  final String thirdLine;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return isPortrait ? buildPortraitLayout() : buildLandScapeLayout();
  }

  Container buildPortraitLayout() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isTablet ? 16.r : 8.r),
          color: cardColor),
      child: Column(
        children: [
          const Spacer(),
          Text(
            firstLine,
            style: TextStyle(color: Colors.white, fontSize: 22.sp),
          ),
          verticalSpace(isTablet ? 16 : 4),
          hasThreeLines
              ? Text(
                  secondLine ?? "",
                  style: TextStyle(color: Colors.white, fontSize: 22.sp),
                )
              : const SizedBox.shrink(),
          verticalSpace(isTablet ? 16 : 4),
          Text(thirdLine,
              style: TextStyle(color: Colors.white, fontSize: 22.sp)),
          const Spacer(),
        ],
      ),
    );
  }

  Container buildLandScapeLayout() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isTablet ? 16.r : 8.r),
          color: cardColor),
      child: Column(
        children: [
          const Spacer(),
          Text(
            firstLine,
            style: TextStyle(color: Colors.white, fontSize: 13.sp),
          ),
          verticalSpace(isTablet ? 16 : 4),
          hasThreeLines
              ? Text(
                  secondLine ?? "",
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                )
              : const SizedBox.shrink(),
          verticalSpace(isTablet ? 16 : 4),
          Text(thirdLine,
              style: TextStyle(color: Colors.white, fontSize: 13.sp)),
          const Spacer(),
        ],
      ),
    );
  }
}

List<Color> cardColors = const [
  Color(0xff9B7EBD),
  Color(0xff77CDFF),
  Color(0xffF95454),
  Color(0xffEC8305),
  Color(0xff859F3D),
  Color(0xffF7B3C9),
  Color(0xffF5986E),
  Color(0xffF8718C),
  Color(0xff9B7EBD),
  Color(0xffF7B3C9),
  Color(0xffF5986E),
  Color(0xff9B7EBD),
  Color(0xff77CDFF),
  Color(0xffF95454),
  Color(0xffEC8305),
  Color(0xff859F3D),
];
