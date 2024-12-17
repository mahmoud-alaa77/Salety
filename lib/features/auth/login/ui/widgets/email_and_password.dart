import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1intern/core/helper/helper_functions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/themes/app_colors.dart';
import 'package:task1intern/core/widgets/app_text_form_field.dart';
import 'package:task1intern/features/auth/login/logic/cubit/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            AppTextFormField(
              hint: "عنوان البريد الالكتروني",
              hintStyle: TextStyle(
                  fontSize: HelperFunctions().getResponsiveFontSize(
                    context,
                    fontSize: 18,
                  ),
                  color: Colors.grey),
              suffixIcon: const Icon(
                Icons.done,
                color: AppColors.greenColor,
              ),
              controller: context.read<LoginCubit>().emailController,
              validator: (val) {
                if (val!.isEmpty) {
                  return "حقل البريد الالكتروني مطلوب";
                }
                return null;
              },
            ),
            verticalSpace(20),
            AppTextFormField(
              controller: context.read<LoginCubit>().passwordController,
              hint: "كلمة المرور",
              hintStyle: TextStyle(
                  fontSize: HelperFunctions().getResponsiveFontSize(
                    context,
                    fontSize: 18,
                  ),
                  color: Colors.grey),
              obscureText: isSecure,
              suffixIcon: IconButton(
                icon: Icon(isSecure ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    isSecure = !isSecure;
                  });
                },
              ),
              validator: (val) {
                if (val!.isEmpty) {
                  return "حقل كلمة المرور  مطلوب";
                }
                return null;
              },
            ),
          ],
        ));
  }
}
