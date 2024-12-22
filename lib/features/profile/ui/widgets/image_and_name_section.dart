import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/features/profile/logic/cubit/profile_cubit.dart';

class ImageAndNameSection extends StatelessWidget {
  final bool isTablet;
  const ImageAndNameSection({super.key, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoaded) {
          return SizedBox(
            width: double.infinity,
            height: getGreenContainerHeight(orientation, isTablet),
            child:
                Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              Container(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 20.r,
                  vertical: 16.r,
                ),
                height: getGreenContainerHeight(orientation, isTablet) - 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.w),
                    color: AppColors.greenColor),
              ),
              Positioned(
                top: 0.h,
                child: Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: isTablet
                                ? 120.w
                                : (!isTablet &&
                                        orientation == Orientation.portrait)
                                    ? 68.w
                                    : 35.w,
                            backgroundColor: Colors.white.withOpacity(.3),
                            child: Container(
                              width: isTablet ? 100.w : 120.w,
                              height: isTablet ? 100.w : 120.w,
                              decoration: BoxDecoration(
                                  color: Colors.yellow, shape: BoxShape.circle),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.r),
                                child: SvgPicture.network(
                                  state.profile.data!.profilePhotoUrl
                                      .toString(),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )),
                        verticalSpace(isTablet ? 12 : 2),
                        Text(
                          state.profile.data!.name.toString(),
                          style: isTablet
                              ? AppTextStyles.font30WhiteBold
                              : AppTextStyles.font18WhiteBold,
                          textAlign: TextAlign.center,
                        ),
                        verticalSpace(isTablet ? 12 : 0),
                        Text(
                          state.profile.data!.email.toString(),
                          style: isTablet
                              ? AppTextStyles.font14greyw200.copyWith(
                                  fontSize: 24.sp,
                                  color: Colors.white.withOpacity(.7))
                              : AppTextStyles.font24WhiteBold.copyWith(
                                  fontSize: 12.sp,
                                  color: Colors.white.withOpacity(.7)),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
              )
            ]),
          );
        } else {
          return CircularProgressIndicator(); // Show loading indicator here.
        }
      },
    );
  }
}

double getGreenContainerHeight(Orientation orientation, bool isTablet) {
  if (orientation == Orientation.portrait && isTablet) {
    return 400.h;
  } else if (orientation == Orientation.portrait && !isTablet) {
    return 220.h;
  } else if (orientation == Orientation.landscape && isTablet) {
    return 400.h;
  } else {
    return 350.h;
  }
}
