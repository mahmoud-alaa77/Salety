import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/custom_shimmer_loading_container.dart';
import 'package:task1intern/features/home/logic/cubit/products_cubit.dart';

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
        height: isTablet
            ? longSide / 2.6
            : !isTablet && isPortrait
                ? 500.h
                : 650.h,
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoaded) {
              return GridView.builder(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
                itemCount: state.products.data!.data!.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 16 / 12),
                itemBuilder: (context, index) {
                  return BestSellerItem(
                    image: state.products.data!.data![index].img.toString(),
                    title: state.products.data!.data![index].name.toString(),
                    price: state.products.data!.data![index].price.toString(),
                    details:
                        state.products.data!.data![index].details.toString(),
                    isFav: state.products.data!.data![index].isFavorite == 0
                        ? false
                        : true,
                  );
                },
              );
            } else if (state is ProductsError) {
              return Text(state.error);
            } else {
              return GridView.builder(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 16 / 12),
                itemBuilder: (context, index) {
                  return CustomShimmerLoadingContainer(height: 100, width: 100);
                },
              );
            }
          },
        ));
  }
}

class BestSellerItem extends StatelessWidget {
  final String image;
  final String title;
  final String details;
  final String price;
  final bool isFav;

  const BestSellerItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.isFav,
    required this.details,
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
                    color: isFav ? AppColors.greenColor : Colors.grey,
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
                          "$price EGP",
                          style: AppTextStyles.font18BlackW300
                              .copyWith(fontSize: 16),
                        ),
                        horizontalSpace(12.w),
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
                          imageUrl:
                              "https://master-market.masool.net/uploads/$image",
                          width: isPortrait ? 50.w : 45.w,
                          errorWidget: (context, url, error) {
                            return SizedBox(
                              width: 50,
                              height: 70.h,
                              child: Center(
                                child: Icon(
                                  Icons.error,
                                  color: AppColors.redColor,
                                ),
                              ),
                            );
                          },
                        )),
                    verticalSpace(4),
                    // Container(
                    //   width: 80,
                    //   height: 25,
                    //   decoration: BoxDecoration(
                    //     color: Colors.orange,
                    //     borderRadius: BorderRadius.circular(16),
                    //   ),
                    //   child: const Center(
                    //     child: Text(
                    //       "فواكه",
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // verticalSpace(4),
                    Text(
                      title,
                      style: AppTextStyles.font14BlackW300,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace(4),
                    Text(
                      details,
                      style: AppTextStyles.font12greyw200,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
