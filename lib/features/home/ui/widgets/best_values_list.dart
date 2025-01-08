import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:task1intern/core/widgets/custom_shimmer_loading_container.dart';
import 'package:task1intern/features/home/logic/cubit/slider_product_cubit.dart';

class BestValuesList extends StatelessWidget {
  final bool isTablet;
  const BestValuesList({super.key, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return isPortrait ? buildPortraitLayout() : buildLandScapeLayout();
  }

  BlocBuilder buildPortraitLayout() {
    return BlocBuilder<SliderProductCubit, SliderProductState>(
      builder: (context, state) {
        if (state is SliderProductLoaded) {
          return SizedBox(
            width: double.infinity,
            height: isTablet ? 220.h : 130.h,
            child: ListView.builder(
              itemCount: state.products.data!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsetsDirectional.symmetric(
                      horizontal: index == 0 ? 0 : 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: SizedBox(
                      width: isTablet ? 400.w : 280.w,
                      height: isTablet ? 200.h : 120.h,
                      child: Image.network(
                        "https://master-market.masool.net/uploads/${state.products.data![index].img}",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is SliderProductError) {
          return Center(child: Text(state.message.toString()));
        } else {
          return SizedBox(
              width: double.infinity,
              height: isTablet ? 220.h : 130.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CustomShimmerLoadingContainer(
                    width: isTablet ? 400.w : 280.w,
                    height: isTablet ? 200.h : 120.h,
                  );
                },
              ));
        }
      },
    );
  }

  BlocBuilder buildLandScapeLayout() {
    return BlocBuilder<SliderProductCubit, SliderProductState>(
      builder: (context, state) {
        if (state is SliderProductLoaded) {
          return SizedBox(
            width: double.infinity,
            height: isTablet ? 220.h : 170.h,
            child: ListView.builder(
              itemCount: state.products.data!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsetsDirectional.symmetric(
                      horizontal: index == 0 ? 0 : 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: SizedBox(
                      width: isTablet ? 450.w : 180.w,
                      height: isTablet ? 215.h : 160.h,
                      child: Image.network(
                      
                           "https://master-market.masool.net/uploads/${state.products.data![index].img}",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is SliderProductLoading) {
          return CircularProgressIndicator();
        } else {
          return SizedBox(
              width: double.infinity,
            height: isTablet ? 220.h : 170.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CustomShimmerLoadingContainer(
                    width: isTablet ? 450.w : 180.w,
                      height: isTablet ? 215.h : 160.h,
                  );
                },
              ));
        }
      },
    );
  }
}
