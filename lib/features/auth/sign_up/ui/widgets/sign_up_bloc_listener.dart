import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/features/auth/sign_up/logic/cubit/sign_up_cubit.dart';

import '../../../../../core/routing/routes.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          context.pop();

          if (state.signUpResponseBody.status == true) {
            context.pushNamed(Routes.mainScreen);
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                icon: const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 32,
                ),
                content: Text(
                  state.signUpResponseBody.errorMessage.toString(),
                  style: AppTextStyles.font18BlackW300,
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      'خروج',
                      style: AppTextStyles.font20BlackW400
                          .copyWith(color: AppColors.redColor),
                    ),
                  ),
                ],
              ),
            );
          }
        } else if (state is SignUpError) {
          setupErrorState(context, state.errorMessage);
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.redColor,
                ),
              );
            },
          );
        }
      },
      child: SizedBox.shrink(),
    );
  }
}

void setupErrorState(BuildContext context, String error) {
  context.pop();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: AppTextStyles.font12BlackW300,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Got it',
            style: AppTextStyles.font10BlackW300,
          ),
        ),
      ],
    ),
  );
}
