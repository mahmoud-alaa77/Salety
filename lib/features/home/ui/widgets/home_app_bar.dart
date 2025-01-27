import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/custom_circle_loading_widget.dart';
import 'package:task1intern/core/widgets/custom_icon_button.dart';
import 'package:task1intern/core/widgets/custom_shimmer_loading_container.dart';
import 'package:task1intern/features/profile/logic/cubit/profile_cubit.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  initState() {
    context.read<ProfileCubit>().getProfileData();
    super.initState();
  }
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.sizeOf(context).shortestSide >= 600;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return isPortrait
        ? buildPortraitLayout(context, isTablet)
        : buildLandScapeLayout(context, isTablet);
  }

  Widget buildPortraitLayout(BuildContext context, bool isTablet) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          return Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.profileScreen);
                  },
                  child: CircleAvatar(
                      radius: isTablet ? 50.w : 25.w,
                      backgroundColor: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        width: isTablet ? 50.w : 25.w,
                        child: Center(
                          child: CachedNetworkImage(
                            imageUrl:
                                state.profile.data!.profilePhotoUrl.toString(),
                            fit: BoxFit.cover,
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
                      )),
                ),
                horizontalSpace(6),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.profile.data!.name.toString(),
                      style: isTablet
                          ? AppTextStyles.font26BlackBold
                          : AppTextStyles.font12BlackW300,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone_android,
                          color: AppColors.redColor,
                        ),
                        horizontalSpace(4),
                        Text(
                          state.profile.data!.mobile.toString(),
                          style: isTablet
                              ? AppTextStyles.font16greyw200
                              : AppTextStyles.font8greyw200,
                        )
                      ],
                    )
                  ],
                ),
                const Spacer(),
                CustomIconButton(
                  icon: Icons.camera_alt_outlined,
                  iconSize: isTablet ? 50.w : 25.w,
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
              ],
            ),
          );
        } else if (state is ProfileError) {
          return Text(state.errorMessage);
        } else {
          return Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
            child: Row(
              children: [
                CustomCircleLoadingWidget(height: 60.h, width: 60.h),
                horizontalSpace(6),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomShimmerLoadingContainer(height: 18.h, width: 100.w),
                    verticalSpace(4),
                    CustomShimmerLoadingContainer(height: 18.h, width: 100.w),
                  ],
                ),
                const Spacer(),
                CustomCircleLoadingWidget(height: 40.h, width: 40.h),
              ],
            ),
          );
        }
      },
    );
  }

  buildLandScapeLayout(BuildContext context, bool isTablet) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          return Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.profileScreen);
                  },
                  child: CircleAvatar(
                      radius: isTablet ? 50.w : 18.w,
                      backgroundColor: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        width: isTablet ? 50.w : 20.w,
                        child: Center(
                          child: CachedNetworkImage(
                            imageUrl:
                                state.profile.data!.profilePhotoUrl.toString(),
                            fit: BoxFit.cover,
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
                      )),
                ),
                horizontalSpace(isTablet ? 6 : 2),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.profile.data!.name.toString(),
                      style: isTablet
                          ? AppTextStyles.font26BlackBold
                          : AppTextStyles.font10BlackW300,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone_android,
                          color: AppColors.redColor,
                        ),
                        horizontalSpace(4),
                        Text(
                          state.profile.data!.mobile.toString(),
                          style: isTablet
                              ? AppTextStyles.font16greyw200
                              : AppTextStyles.font8greyw200,
                        )
                      ],
                    )
                  ],
                ),
                const Spacer(),
                CustomIconButton(
                  icon: Icons.camera_alt_outlined,
                  iconSize: isTablet ? 45.w : 20.w,
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
              ],
            ),
          );
        } else if (state is ProfileError) {
          return Text(state.errorMessage);
        } else {
          return Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 16.r),
            child: Row(
              children: [
                CustomCircleLoadingWidget(height: 60.h, width: 60.h),
                horizontalSpace(0),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomShimmerLoadingContainer(height: 18.h, width: 100.w),
                    verticalSpace(8),
                    CustomShimmerLoadingContainer(height: 18.h, width: 100.w),
                  ],
                ),
                const Spacer(),
                CustomCircleLoadingWidget(height: 40.h, width: 40.h),
              ],
            ),
          );
        }
      },
    );
  }
}


