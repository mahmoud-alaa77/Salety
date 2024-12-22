import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/helper/helper_functions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/core/widgets/text_and_colored_buton.dart';
import 'package:task1intern/features/auth/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:task1intern/features/auth/sign_up/ui/widgets/another_sign_up_ways.dart';
import 'package:task1intern/features/auth/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:task1intern/features/auth/sign_up/ui/widgets/sign_up_form.dart';
import 'package:task1intern/features/auth/widgets/auth_app_bar.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthAppBar(screenWidth: screenWidth),
                isPortrait
                    ? buildRegisterBody(context, screenHeight)
                    : Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: screenWidth / 5),
                        child: buildRegisterBody(context, screenWidth),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

buildRegisterBody(BuildContext context, double screenHeight) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "انشاء حساب جديد",
        style: AppTextStyles.font26BlackBold.copyWith(fontSize: 26),
      ),
      verticalSpace(4),
      Text(
        "ادخل بياناتك لانشاء الحساب",
        style: AppTextStyles.font16greyw200.copyWith(fontSize: 14),
      ),
      verticalSpace(24),
      SignUpForm(),
      verticalSpace(.08 * screenHeight),
      TextAndColoredButton(
          height: screenHeight * .065,
          title: "اشتراك",
          onTap: () {
            context.read<SignUpCubit>().validateAndSignUp();
          },
          width: double.infinity,
          color: AppColors.greenColor),
      verticalSpace(.028 * screenHeight),
      Align(
          alignment: AlignmentDirectional.center,
          child: Text(
            "أو اشترك مع",
            style: AppTextStyles.font18BlackW300.copyWith(
                fontSize: HelperFunctions()
                    .getResponsiveFontSize(context, fontSize: 18)),
          )),
      verticalSpace(.028 * screenHeight),
      const AnotherSignUpWays(),
      verticalSpace(0.028 * screenHeight),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "لديك حساب بالفعل ",
            style: AppTextStyles.font18BlackW300.copyWith(
                fontSize: HelperFunctions()
                    .getResponsiveFontSize(context, fontSize: 18)),
          ),
          TextButton(
            onPressed: () {
              context.pushNamed(Routes.loginScreen);
            },
            child: Text(
              "تسجيل الدخول ",
              style: AppTextStyles.font18BlackW300.copyWith(
                  fontSize: HelperFunctions()
                      .getResponsiveFontSize(context, fontSize: 18)),
            ),
          )
        ],
      ),
      SignUpBlocListener()
    ],
  );
}
