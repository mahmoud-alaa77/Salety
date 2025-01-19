import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/custom_shimmer_loading_container.dart';
import 'package:task1intern/features/home/logic/cubit/products_cubit.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        title: Text('كل المنتجات'),
        elevation: 0,
        backgroundColor: AppColors.backGroundColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoaded) {
                  return ListView.builder(
                    itemCount: state.products.data!.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24.r)),
                        margin: EdgeInsetsDirectional.symmetric(
                            horizontal: isPortrait ? 16.r : 120.r,
                            vertical: 12.r),
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 8.r, vertical: 12.r),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://master-market.masool.net/uploads/${state.products.data!.data![index].img}",
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
                                    state.products.data!.data![index].name
                                        .toString(),
                                    style: AppTextStyles.font14BlackW300,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  verticalSpace(4),
                                  Text(
                                    state.products.data!.data![index].details
                                        .toString(),
                                    style: AppTextStyles.font12greyw200,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  verticalSpace(4),
                                  Text(
                                    "${state.products.data!.data![index].price} EGP",
                                    style: AppTextStyles.font12BlackW300
                                        .copyWith(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.favorite,
                                color:
                                    true ? AppColors.greenColor : Colors.grey,
                                size: isPortrait ? 30.w : 15.w,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: 6,
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
            ),
          ),
          verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              currentPage == 1
                  ? SizedBox.shrink()
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          if (currentPage != 1) {
                            currentPage--;
                          }
                          context
                              .read<ProductsCubit>()
                              .getAllProducts(currentPage);
                        });
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios),
                          Text("السابق"),
                        ],
                      ),
                    ),
              horizontalSpace(16),
              Text(
                "$currentPage",
                style: AppTextStyles.font24RedBold,
              ),
              horizontalSpace(16),
              currentPage == 6
                  ? SizedBox.shrink()
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          if (currentPage != 6) {
                            currentPage++;
                          }
                          context
                              .read<ProductsCubit>()
                              .getAllProducts(currentPage);
                        });
                      },
                      child: Row(
                        children: [
                          Text("التالي"),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    )
            ],
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}
