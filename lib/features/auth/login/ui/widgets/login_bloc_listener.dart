import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1intern/core/helper/extentions.dart';
import 'package:task1intern/core/routing/routes.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/themes/app_text_styles.dart';
import 'package:task1intern/features/auth/login/logic/cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
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
        } else if (state is LoginSuccess) {
          context.pop();

          if (state.responseModel.status == true) {
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
                  state.responseModel.message.toString(),
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
        } else if (state is LoginError) {
          context.pop();

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
