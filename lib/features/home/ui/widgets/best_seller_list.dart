import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';

class BestSellerList extends StatelessWidget {
  const BestSellerList({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double longSide = MediaQuery.of(context).size.longestSide;
        bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;


    return SizedBox(
        width: double.infinity,
        height: isTablet ? longSide / 2.6 : !isTablet&&isPortrait? 450.h :650.h,
        child: GridView.builder(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
          itemCount: 20,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 16 / 12),
          itemBuilder: (context, index) {
            return const BestSellerItem();
          },
        ));
  }
}

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.shopingCartScreen);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(16.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(16.r),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                child: Container(
                  width: 60,
                  height: 25,
                  decoration: const BoxDecoration(
                    color: AppColors.greenColor,
                    borderRadius: BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(16),
                        topEnd: Radius.circular(16)),
                  ),
                  child: const Center(
                    child: Text(
                      "جديد",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 10,
                  left: 10,
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.greenColor,
                    size: isPortrait ? 30.w : 15.w,
                  )),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 450 * 16 / 12,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.7),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 4.r),
                    child: Row(
                      children: [
                        horizontalSpace(12),
                        Text(
                          "40 EGP",
                          style: AppTextStyles.font18BlackW300
                              .copyWith(fontSize: 16),
                        ),
                        horizontalSpace(40.w),
                        const CircleAvatar(
                          backgroundColor: AppColors.redColor,
                          child: Icon(
                            Icons.date_range,
                            color: Colors.white,
                          ),
                        ),
                        horizontalSpace(6),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(32),
                    Align(
                        alignment: AlignmentDirectional.center,
                        child: Image.asset(
                          "assets/images/fruits.png",
                          width: isPortrait ? 100.w : 75.w,
                        )),
                    verticalSpace(4),
                    Container(
                      width: 80,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Text(
                          "فواكه",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(4),
                    Text(
                      "طبق فواكه",
                      style: AppTextStyles.font12greyw200,
                    ),
                    verticalSpace(4),
                    Text(
                      "1 Kg",
                      style: AppTextStyles.font12greyw200,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
