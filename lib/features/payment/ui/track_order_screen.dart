import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/custom_app_bar.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  bool isActive1 = false;
  bool isActive2 = false;
  bool isActive3 = false;
  bool isActive4 = false;
  bool isActive5 = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    // double screenHeight = MediaQuery.sizeOf(context).height;
    double shortSide = MediaQuery.sizeOf(context).shortestSide;

      bool isPortrait =
       MediaQuery.of(context).orientation == Orientation.portrait;
    bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: isTablet ? 125.r : 16.r, vertical: 12.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                  title: "ترتيب المسار",
                  textStyle: AppTextStyles.font18BlackW300),
              verticalSpace(12),
              Container(
                padding: EdgeInsetsDirectional.symmetric(
                    vertical: 16.r, horizontal:isTablet? 16.r:  8.r),
                    margin: EdgeInsetsDirectional.symmetric(horizontal: isPortrait ?0:shortSide/3),
                width: isTablet ? shortSide : screenWidth,
                decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "معرف الطلب : #OD2204",
                          style: AppTextStyles.font18WhiteBold,
                        ),
                        const Text(
                          "تاريخ النشر 26 كانون الثاني (يناير) 2023",
                          style: TextStyle(color: Colors.white),
                        ),
                        verticalSpace(12),
                        Row(
                          children: [
                            const Text(
                              "البنود : 15",
                              style: TextStyle(color: Colors.white),
                            ),
                            horizontalSpace(12),
                            const Text(
                              "الاجمالي : 100 ريال",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                    CircleAvatar(
                        radius:isTablet?shortSide/10 : shortSide / 7.5,
                        backgroundColor: Colors.white,
                        child: Center(
                          child: Icon(
                            Icons.free_breakfast_outlined,
                            size:isTablet? shortSide/8: shortSide / 6,
                            color: Colors.black,
                          ),
                        ))
                  ],
                ),
              ),
              verticalSpace(isTablet ?36:12),
              Container(
                                   margin: EdgeInsetsDirectional.symmetric(horizontal: isPortrait ?0:shortSide/3),

                  padding: EdgeInsetsDirectional.symmetric(horizontal: 26.r),
                  width: isTablet ? shortSide : screenWidth,
                  // height: isPortrait ? screenHeight / 1.85 : shortSide,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: AnotherStepper(
                      iconWidth: 60.w,
                      iconHeight: 60.h,
                      scrollPhysics: const BouncingScrollPhysics(),
                      verticalGap: 30.h,
                      //  inverted: true,
                      //activeBarColor: Colors.grey,
                      inActiveBarColor: Colors.grey,
                      stepperList: [
                        buildCustomStepperDAta(
                            isActive: isActive1,
                            title: "تم الطلب",
                            icon: Icons.check_circle,
                            subTitleActive: "12 نوفمبر 2024",
                            subTitleNonActive: "قيد الانتظار",
                            onPressed: () {
                              setState(() {
                                isActive1 = !isActive1;
                              });
                            }),
                        buildCustomStepperDAta(
                            onPressed: () {
                              setState(() {
                                isActive2 = !isActive2;
                              });
                            },
                            isActive: isActive2,
                            title: "Order",
                            icon: Icons.inventory,
                            subTitleActive: "12 نوفمبر 2024",
                            subTitleNonActive: "قيد الانتظار"),
                        buildCustomStepperDAta(
                            isActive: isActive3,
                            title: "تم شحن الطلب",
                            icon: Icons.local_shipping,
                            subTitleActive: "12 نوفمبر 2024",
                            subTitleNonActive: "قيد الانتظار",
                            onPressed: () {
                              setState(() {
                                isActive3 = !isActive3;
                              });
                            }),
                        buildCustomStepperDAta(
                            isActive: isActive4,
                            title: "خارج الخدمة",
                            icon: Icons.pause_circle_outline,
                            subTitleActive: "12 نوفمبر 2024",
                            subTitleNonActive: "قيد الانتظار",
                            onPressed: () {
                              setState(() {
                                isActive4 = !isActive4;
                              });
                            }),
                        buildCustomStepperDAta(
                            isActive: isActive5,
                            title: "اجل التسليم",
                            icon: Icons.access_time,
                            subTitleActive: "12 نوفمبر 2024",
                            subTitleNonActive: "قيد الانتظار",
                            onPressed: () {
                              setState(() {
                                isActive5 = !isActive5;
                              });
                            }),
                      ],
                      stepperDirection: Axis.vertical)),
              verticalSpace(24.r)
            ],
          ),
        ),
      ),
    ));
  }

  StepperData buildCustomStepperDAta(
      {required bool isActive,
      required String title,
      required String subTitleActive,
      required String subTitleNonActive,
      required IconData icon,
      required void Function()? onPressed}) {
    return StepperData(
      title: StepperText(title,
          textStyle: TextStyle(
              color: isActive ? Colors.green : Colors.grey,
              fontWeight: FontWeight.bold)),
      subtitle: StepperText(isActive ? subTitleActive : subTitleNonActive,
          textStyle: const TextStyle(color: Colors.grey)),
      iconWidget: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? AppColors.greenColor.withOpacity(.3)
                : Colors.grey.withOpacity(.5)),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: isActive ? Colors.green : Colors.grey),
        ),
      ),
    );
  }
}
