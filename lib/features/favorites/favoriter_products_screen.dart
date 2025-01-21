import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:task1intern/core/widgets/custom_shimmer_loading_container.dart';

class FavoriterProductsScreenBody extends StatelessWidget {
  const FavoriterProductsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoaded) {
          return ListView.builder(
            itemCount: state.favoriteProductModel.data!.length,
            itemBuilder: (context, index) {
              // int? productId = state.favoriteProductModel.data![index].id;

              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24.r)),
                margin: EdgeInsetsDirectional.symmetric(
                    horizontal: isPortrait ? 16.r : 120.r, vertical: 12.r),
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 8.r, vertical: 12.r),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://master-market.masool.net/uploads/${state.favoriteProductModel.data?[index].product?.img.toString()}",
                        width: isPortrait ? 100.w : 50.w,
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
                      ),
                    ),
                    horizontalSpace(6),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            state.favoriteProductModel.data?[index].product?.name
                                    .toString() ??
                                "",
                            style: AppTextStyles.font14BlackW300,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          verticalSpace(4),
                          Text(
                            state.favoriteProductModel.data?[index].product
                                    ?.details ??
                                "",
                            style: AppTextStyles.font12greyw200,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          verticalSpace(4),
                          Text(
                            "${state.favoriteProductModel.data?[index].product?.price ?? ""} EGP",
                            style: AppTextStyles.font12BlackW300
                                .copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          // context
                          //     .read<FavoritesCubit>()
                          //     .addOrDeleteProduct(productId!);
                        },
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.greenColor,
                          size: isPortrait ? 30.w : 15.w,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        } else if (state is FavoritesError) {
          return Center(
              child: Text(
            state.errorMessage,
          ));
        } else {
          return ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    vertical: 16.r, horizontal: isPortrait ? 0 : 120.r),
                child: CustomShimmerLoadingContainer(
                    height: 140.h, width: double.infinity),
              );
            },
          );
        }
      },
    );
  }
}
