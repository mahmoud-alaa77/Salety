import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/custom_icon_button.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;
    Orientation orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: orientation == Orientation.landscape
                  ? MediaQuery.sizeOf(context).width / 6.r
                  :orientation == Orientation.portrait &&isTablet ?MediaQuery.sizeOf(context).width / 10.r : 24.r,
              vertical: 16.r),
          child: Column(
            children: [
              buildAppBar(isTablet, orientation, context),
              verticalSpace(isTablet ? 24 : 16),
              Expanded(
                child: GridView.builder(
                  itemCount: 15,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          isTablet && orientation == Orientation.landscape
                              ? 4
                              : !isTablet && orientation == Orientation.portrait
                                  ? 2
                                  : 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 20,
                      childAspectRatio: isTablet ? 1 : 1),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.oneCategoryScreen);
                      },
                      child: AspectRatio(
                        aspectRatio: .8,
                        child: Container(
                          margin:
                              EdgeInsetsDirectional.symmetric(horizontal: 8.r),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: SizedBox(
                                height: isTablet ? 350 : 150.h,
                                width: MediaQuery.sizeOf(context).width,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      child: Container(
                                        height: isTablet ? 350.h : 140.h,
                                        width: MediaQuery.sizeOf(context).width,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        height: isTablet &&
                                                orientation ==
                                                    Orientation.portrait
                                            ? 210.h
                                            : isTablet &&
                                                    orientation ==
                                                        Orientation.landscape
                                                ? 170.h
                                                : 80.h,
                                        width: isTablet ? 400.w : 250.w,
                                        decoration: const BoxDecoration(),
                                        child: Image.asset(
                                          "assets/images/fruits_category.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional.center,
                                      child: CircleAvatar(
                                        radius: isTablet &&
                                                orientation ==
                                                    Orientation.landscape
                                            ? 26.w
                                            : orientation ==
                                                    Orientation.portrait
                                                ? 30.w
                                                : 15.w,
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional.center,
                                      child: CircleAvatar(
                                        radius: isTablet ? 40 : 27,
                                        backgroundColor: Colors.orange,
                                        backgroundImage: const AssetImage(
                                            "assets/images/category_icon.png"),
                                      ),
                                    ),
                                    Align(
                                        alignment:
                                            AlignmentDirectional.topCenter,
                                        child: Container(
                                          margin: EdgeInsetsDirectional.only(
                                              top: isTablet ? 24.h : 10.h),
                                          child: Text(
                                            "فواكه",
                                            style: isTablet
                                                ? AppTextStyles.font22BlackBold
                                                : AppTextStyles.font18BlackW300,
                                          ),
                                        ))
                                  ],
                                )),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildAppBar(
      bool isTablet, Orientation orientation, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconButton(
          icon: Icons.camera_alt_outlined,
          iconSize: isTablet
              ? 55.w
              : !isTablet && orientation == Orientation.portrait
                  ? 35.w
                  : 20.w,
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
        ),
        Text(
          "التصنيفات",
          style: isTablet
              ? AppTextStyles.font22BlackBold
              : AppTextStyles.font18BlackW300,
        ),
        CustomIconButton(
          icon: Icons.arrow_forward_ios,
          iconSize: isTablet
              ? 55.w
              : !isTablet && orientation == Orientation.portrait
                  ? 35.w
                  : 20.w,
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
          onTap: () {
            context.pop();
          },
        ),
      ],
    );
  }
}
