import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/custom_shimmer_loading_container.dart';
import 'package:task1intern/features/home/logic/cubit/categories_cubit.dart';

class CategoriesListView extends StatelessWidget {
  final bool isTablet;
  final CategoryItemSize categoryItemSize;
  const CategoriesListView(
      {super.key, required this.isTablet, required this.categoryItemSize});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return isPortrait ? buildPortraitLayout() : buildLandScapeLayout();
  }

  SizedBox buildPortraitLayout() {
    return SizedBox(
      width: double.infinity,
      height: isTablet ? 220.h : 150.h,
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoaded) {
            return ListView.builder(
              itemCount: state.categories.data!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.oneCategoryScreen,
                        arguments: state.categories.data![index]);
                  },
                  child: Container(
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 8.r),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(isTablet ? 16.r : 12.r),
                      child: SizedBox(
                          height: categoryItemSize.mainHeight,
                          width: categoryItemSize.mainWidth,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                child: Container(
                                  height: categoryItemSize.whiteContainerHeight,
                                  width: categoryItemSize.mainWidth,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  height: categoryItemSize.imageHeight,
                                  width: categoryItemSize.mainWidth,
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
                                  radius: categoryItemSize.largeCircleRaduis,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.center,
                                child: CircleAvatar(
                                  radius: categoryItemSize.smallCircleRaduis,
                                  backgroundColor: Colors.orange,
                                  backgroundImage: NetworkImage(
                                    "https://master-market.masool.net/uploads/${state.categories.data![index].img.toString()}",
                                  ),
                                ),
                              ),
                              Align(
                                  alignment: AlignmentDirectional.topCenter,
                                  child: Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: isTablet ? 14.h : 10.h),
                                    child: Text(
                                      state.categories.data![index].name
                                          .toString(),
                                      style: isTablet
                                          ? AppTextStyles.font22BlackBold
                                          : AppTextStyles.font18BlackW300,
                                    ),
                                  ))
                            ],
                          )),
                    ),
                  ),
                );
              },
            );
          } else if (state is CategoriesError) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return CustomShimmerLoadingContainer(
                  height: categoryItemSize.mainHeight,
                  width: categoryItemSize.mainWidth,
                );
              },
            );
          }
        },
      ),
    );
  }

  SizedBox buildLandScapeLayout() {
    return SizedBox(
      width: double.infinity,
      height: isTablet ? 250.h : 150.h,
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoaded) {
            return ListView.builder(
              itemCount: 12,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.oneCategoryScreen,
                        arguments: state.categories.data![index]);
                  },
                  child: Container(
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 8.r),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(isTablet ? 16.r : 12.r),
                      child: SizedBox(
                          height: categoryItemSize.mainHeight,
                          width: categoryItemSize.mainWidth,
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                child: Container(
                                  height: categoryItemSize.whiteContainerHeight,
                                  width: categoryItemSize.mainWidth,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  height: categoryItemSize.imageHeight,
                                  width: categoryItemSize.mainWidth,
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
                                  radius: categoryItemSize.largeCircleRaduis,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.center,
                                child: CircleAvatar(
                                  radius: categoryItemSize.smallCircleRaduis,
                                  backgroundColor: Colors.orange,
                                  backgroundImage: const AssetImage(
                                      "assets/images/category_icon.png"),
                                ),
                              ),
                              Align(
                                  alignment: AlignmentDirectional.topCenter,
                                  child: Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: isTablet ? 14.h : 10.h),
                                    child: Text(
                                      "فواكه",
                                      style: isTablet
                                          ? AppTextStyles.font16greyw200
                                              .copyWith(color: Colors.black)
                                          : AppTextStyles.font8BlackW300,
                                    ),
                                  ))
                            ],
                          )),
                    ),
                  ),
                );
              },
            );
          } else if (state is CategoriesError) {
            return const Center(
              child: Text("Error"),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return CustomShimmerLoadingContainer(
                  height: categoryItemSize.mainHeight,
                  width: categoryItemSize.mainWidth,
                );
              },
            );
          }
        },
      ),
    );
  }
}

class CategoryItemSize {
  final double mainHeight;
  final double mainWidth;
  final double whiteContainerHeight;
  final double imageHeight;
  final double largeCircleRaduis;
  final double smallCircleRaduis;

  CategoryItemSize({
    required this.mainHeight,
    required this.mainWidth,
    required this.whiteContainerHeight,
    required this.imageHeight,
    required this.largeCircleRaduis,
    required this.smallCircleRaduis,
  });
}
