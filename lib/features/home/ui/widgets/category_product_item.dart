import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';

class CategoryProductItem extends StatelessWidget {
  final String name;
  final String image;
  final String maiCategory;
  final String description;
  const CategoryProductItem({
    super.key,
    required this.name,
    required this.image,
    required this.maiCategory,
    required this.description,
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
                    color: Colors.grey.withValues(alpha: .7),
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
                        CircleAvatar(
                          backgroundColor: AppColors.redColor,
                          child: Icon(
                            Icons.date_range,
                            color: Colors.white,
                            size: 20.r,
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
                        child: CachedNetworkImage(
                          imageUrl: image,
                          fit: BoxFit.cover,
                          width: isPortrait ? 50.w : 40.w,
                          progressIndicatorBuilder: (context, url, progress) {
                            return CircularProgressIndicator(
                              color: AppColors.greenColor,
                              strokeWidth: 2,
                            );
                          },
                        )),
                    verticalSpace(4),
                    Container(
                      width: 80,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          maiCategory,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(4),
                    Text(
                      name,
                      style: AppTextStyles.font12greyw200,
                    ),
                    verticalSpace(4),
                    Text(
                      description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
