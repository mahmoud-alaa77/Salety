import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/features/home/ui/widgets/best_seller_list.dart';
import 'package:task1intern/features/home/ui/widgets/best_values_list.dart';
import 'package:task1intern/features/home/ui/widgets/categories_list_view.dart';
import 'package:task1intern/features/home/ui/widgets/category_title_widget.dart';
import 'package:task1intern/features/home/ui/widgets/chances_list.dart';
import 'package:task1intern/features/home/ui/widgets/home_app_bar.dart';
import 'package:task1intern/features/home/ui/widgets/home_image_container.dart';
import 'package:task1intern/features/home/ui/widgets/offers_list_view.dart';
import 'package:task1intern/features/home/ui/widgets/search_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;
    double shortSide = MediaQuery.sizeOf(context).shortestSide;
    double longSide = MediaQuery.sizeOf(context).longestSide;
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
          child: isPortrait
              ? buildPortraitLayout(context, isTablet, shortSide, longSide)
              : buildLAndScapeLayout(context, isTablet, shortSide, longSide)),
    );
  }

  Widget buildPortraitLayout(
      BuildContext context, bool isTablet, double shortSide, double longSide) {
    return Column(
      children: [
        const HomeAppBar(),
        verticalSpace(isTablet ? 24 : 16),
        Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
            child: const SearchSection()),
        verticalSpace(isTablet ? 24 : 12),
        const CategoryTitleWidget(
          title: 'القيمة الافضل',
          subtitle: "اعلي المبيعات",
        ),
        verticalSpace(isTablet ? 24 : 12),
        BestValuesList(
          isTablet: isTablet,
        ),
        verticalSpace(isTablet ? 24 : 12),
        CategoryTitleWidget(
          title: 'التصنيفات',
          subtitle: "",
          onTap: () {
            context.pushNamed(Routes.allCategoriesScreen);
          },
        ),
        verticalSpace(isTablet ? 24 : 12),
        CategoriesListView(
          isTablet: isTablet,
          categoryItemSize: CategoryItemSize(
            mainHeight: isTablet ? 200 : 120.h,
            mainWidth: isTablet ? 200 : 120.h,
            whiteContainerHeight: isTablet ? 115.h : 70.h,
            imageHeight: isTablet ? 110.h : 70.h,
            largeCircleRaduis: isTablet ? 45.w : 30.w,
            smallCircleRaduis: isTablet ? 40 : 27,
          ),
        ),
        verticalSpace(isTablet ? 24 : 12),
        const CategoryTitleWidget(
          title: 'الاكثر مبيعا',
          subtitle: "",
        ),
        verticalSpace(isTablet ? 24 : 12),
        const BestSellerList(),
        verticalSpace(isTablet ? 24 : 12),
        HomeImageContainer(
          isTablet: isTablet,
        ),
        verticalSpace(isTablet ? 24 : 12),
        const CategoryTitleWidget(
          title: 'تسوق حسب العروض',
          subtitle: "",
        ),
        verticalSpace(isTablet ? 24 : 12),
        OffersListView(
          isTablet: isTablet,
        ),
        verticalSpace(isTablet ? 24 : 12),
        const CategoryTitleWidget(
          title: 'طازج وسريع',
          subtitle: "",
        ),
        verticalSpace(isTablet ? 24 : 12),
        const BestSellerList(),
        verticalSpace(isTablet ? 24 : 12),
        HomeImageContainer(
          isTablet: isTablet,
        ),
        verticalSpace(isTablet ? 24 : 12),
        const CategoryTitleWidget(
          title: 'انتهز الفرصة',
          subtitle: "",
        ),
        verticalSpace(isTablet ? 24 : 12),
        const ChancesList(),
      ],
    );
  }

  buildLAndScapeLayout(
      BuildContext context, bool isTablet, double shortSide, double longSide) {
        return Column(
      children: [
        const HomeAppBar(),
        verticalSpace(isTablet ? 24 : 16),
         Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 24.r),
            child: const SearchSection()),
                    verticalSpace(isTablet ? 24 : 16),
                    const CategoryTitleWidget(
          title: 'القيمة الافضل',
          subtitle: "اعلي المبيعات",
        ),
        verticalSpace(isTablet ? 24 : 12),
        BestValuesList(
          isTablet: isTablet,
        ),
verticalSpace(isTablet ? 24 : 12),
        CategoryTitleWidget(
          title: 'التصنيفات',
          subtitle: "",
          onTap: () {
            context.pushNamed(Routes.allCategoriesScreen);
          },
        ),
        verticalSpace(isTablet ? 24 : 12),
        CategoriesListView(
          isTablet: isTablet,
          categoryItemSize: CategoryItemSize(
            mainHeight: isTablet ? 260 : 150.h,
            mainWidth: isTablet ? 240 : 150.h,
            whiteContainerHeight: isTablet ? 140.h : 85.h,
            imageHeight: isTablet ? 125.h : 65.h,
            largeCircleRaduis: isTablet ? 25.w : 13.w,
            smallCircleRaduis: isTablet ? 23.w : 12.w,
          ),
        ),
        verticalSpace(isTablet ? 24 : 12),
        const CategoryTitleWidget(
          title: 'الاكثر مبيعا',
          subtitle: "",
        ),
        verticalSpace(isTablet ? 24 : 12),
        const BestSellerList(),
        verticalSpace(isTablet ? 24 : 12),
        HomeImageContainer(
          isTablet: isTablet,
        ),
         verticalSpace(isTablet ? 24 : 12),
        const CategoryTitleWidget(
          title: 'تسوق حسب العروض',
          subtitle: "",
        ),
        verticalSpace(isTablet ? 24 : 12),
        OffersListView(
          isTablet: isTablet,
        ),
        verticalSpace(isTablet ? 24 : 12),
        const CategoryTitleWidget(
          title: 'طازج وسريع',
          subtitle: "",
        ),
        verticalSpace(isTablet ? 24 : 12),
        const BestSellerList(),
        verticalSpace(isTablet ? 24 : 12),
          verticalSpace(isTablet ? 24 : 12),
        HomeImageContainer(
          isTablet: isTablet,
        ),
        verticalSpace(isTablet ? 24 : 12),
        const CategoryTitleWidget(
          title: 'انتهز الفرصة',
          subtitle: "",
        ),
        verticalSpace(isTablet ? 24 : 12),
        const ChancesList(),
        ]);
      }
}
