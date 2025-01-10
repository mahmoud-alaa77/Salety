import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/custom_app_bar.dart';
import 'package:task1intern/features/home/data/models/category_model.dart';
import 'package:task1intern/features/home/ui/widgets/category_product_item.dart';
import 'package:task1intern/features/home/ui/widgets/search_section.dart';

class OneCategoryScreen extends StatelessWidget {
  final Data categoryModel;
  const OneCategoryScreen({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;

    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: !isTablet
              ? buildMobileLayout(
                  isTablet: isTablet,
                  isPortrait: isPortrait,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  model: categoryModel)
              : buildTabletLayout(
                  isTablet: isTablet,
                  isPortrait: isPortrait,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  model: categoryModel)),
    );
  }
}

Widget buildMobileLayout(
    {required bool isTablet,
    required bool isPortrait,
    required double screenWidth,
    required double screenHeight,
    required Data model}) {
  return CustomScrollView(
    scrollDirection: Axis.vertical,
    physics: const ClampingScrollPhysics(),
    slivers: [
      SliverToBoxAdapter(
        child: SizedBox(
          width: screenWidth,
          height: isPortrait ? screenHeight / 4.5 : screenHeight / 2,
          child: Stack(
            children: [
              Container(
                width: screenWidth,
                height: isPortrait ? screenHeight / 5.8 : screenHeight / 2.6,
                decoration: const BoxDecoration(
                  color: AppColors.greenColor,
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: CircleAvatar(
                  radius: !isPortrait ? 25.w : 50.w,
                  backgroundColor: Colors.white.withOpacity(.3),
                  child: CircleAvatar(
                    radius: !isPortrait ? 20.w : 45.w,
                    backgroundImage: NetworkImage(
                        "https://master-market.masool.net/uploads/${model.img}"),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 24.r, vertical: 12.r),
                child: CustomAppBar(
                  title: model.name.toString(),
                  textStyle: AppTextStyles.font18BlackW300
                      .copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: isPortrait ? 16.r : screenWidth / 12),
            child: const SearchSection()),
      ),
      SliverToBoxAdapter(
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: model.subCat!.length,
          padding:
              EdgeInsetsDirectional.all(isPortrait ? 16.r : screenWidth / 12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isPortrait ? 2 : 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 20,
              childAspectRatio: .8),
          itemBuilder: (context, index) {
            return CategoryProductItem(
              image:
                  "https://master-market.masool.net/uploads/${model.subCat![index].img.toString()}",
              name: model.subCat![index].name.toString(),
              maiCategory: model.name.toString(),
              description: model.subCat![index].details.toString(),
            );
          },
        ),
      )
    ],
  );
}

Widget buildTabletLayout(
    {required bool isTablet,
    required bool isPortrait,
    required double screenWidth,
    required double screenHeight,
    required Data model}) {
  return CustomScrollView(
    scrollDirection: Axis.vertical,
    physics: const ClampingScrollPhysics(),
    slivers: [
      SliverToBoxAdapter(
        child: SizedBox(
          width: screenWidth,
          height: isPortrait ? screenHeight / 4.5 : screenHeight / 2.4,
          child: Stack(
            children: [
              Container(
                width: screenWidth,
                height: isPortrait ? screenHeight / 5.8 : screenHeight / 3,
                decoration: const BoxDecoration(
                  color: AppColors.greenColor,
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: CircleAvatar(
                  radius: isPortrait ? 85.w : 100.w,
                  backgroundColor: Colors.white.withOpacity(.3),
                  child: CircleAvatar(
                    radius: isPortrait ? 78.w : 90.w,
                    backgroundImage: NetworkImage(
                        "https://master-market.masool.net/uploads/${model.img.toString()}"),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 24.r, vertical: 12.r),
                child: CustomAppBar(
                    title: model.name.toString(),
                    textStyle: AppTextStyles.font26BlackBold
                        .copyWith(color: Colors.white, fontSize: 30.sp)),
              )
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: isPortrait ? 28.r : screenWidth / 6),
            child: const SearchSection()),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
              horizontal: isPortrait ? 28.r : screenWidth / 6 - 28.r),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 15,
            padding: EdgeInsetsDirectional.all(28.r),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: .8),
            itemBuilder: (context, index) {
              return CategoryProductItem(
                image:
                    "https://master-market.masool.net/uploads/${model.subCat![index].img.toString()}",
                name: model.subCat![index].name.toString(),
                maiCategory: model.name.toString(),
                description: model.subCat![index].details.toString(),
              );
            },
          ),
        ),
      )
    ],
  );
}
