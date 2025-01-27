import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:task1intern/core/widgets/custom_shimmer_loading_container.dart';
import 'package:task1intern/features/home/logic/cubit/slider_product_cubit.dart';

class BestValuesList extends StatefulWidget {
  final bool isTablet;
  const BestValuesList({super.key, required this.isTablet});

  @override
  State<BestValuesList> createState() => _BestValuesListState();
}

class _BestValuesListState extends State<BestValuesList> {
  late ScrollController _scrollController;
  late Timer _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _autoScrollTimer.cancel();
    super.dispose();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 8), (timer) {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.offset;

        if (currentScroll < maxScroll) {
          _scrollController.animateTo(
            currentScroll + 280.w, // Adjust the scroll offset per animation
            duration: const Duration(milliseconds: 3000),
            curve: Curves.easeInOut,
          );
        } else {
          _scrollController
              .jumpTo(0); // Reset to the start when reaching the end
        }
      }
    });
  }

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
            height: widget.isTablet ? 220.h : 130.h,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: state.products.data!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsetsDirectional.symmetric(
                      horizontal: index == 0 ? 0 : 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: SizedBox(
                      width: widget.isTablet ? 400.w : 280.w,
                      height: widget.isTablet ? 200.h : 120.h,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://master-market.masool.net/uploads/${state.products.data![index].img}",
                        fit: BoxFit.contain,
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
              height: widget.isTablet ? 220.h : 130.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CustomShimmerLoadingContainer(
                    width: widget.isTablet ? 400.w : 280.w,
                    height: widget.isTablet ? 200.h : 120.h,
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
            height: widget.isTablet ? 220.h : 170.h,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: state.products.data!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsetsDirectional.symmetric(
                      horizontal: index == 0 ? 0 : 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: SizedBox(
                      width: widget.isTablet ? 450.w : 180.w,
                      height: widget.isTablet ? 215.h : 160.h,
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://master-market.masool.net/uploads/${state.products.data![index].img}",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is SliderProductError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return SizedBox(
              width: double.infinity,
              height: widget.isTablet ? 220.h : 170.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CustomShimmerLoadingContainer(
                    width: widget.isTablet ? 450.w : 180.w,
                    height: widget.isTablet ? 215.h : 160.h,
                  );
                },
              ));
        }
      },
    );
  }
}
