import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1intern/core/helper/helper_functions.dart';
import 'package:task1intern/core/helper/spacing.dart';
import 'package:task1intern/core/widgets/app_text_form_field.dart';
import 'package:task1intern/features/auth/sign_up/logic/cubit/sign_up_cubit.dart';

import '../../../../../core/themes/app_colors.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<SignUpCubit>().nameController,
            validator: (val) {
              if (val!.isEmpty) {
                return "حقل البريد الالكتروني مطلوب";
              }
              return null;
            },
            hint: "الاسم",
            keyboardType: TextInputType.name,
            hintStyle: TextStyle(
                fontSize: HelperFunctions().getResponsiveFontSize(
                  context,
                  fontSize: 18,
                ),
                color: Colors.grey),
          ),
          verticalSpace(20),
          AppTextFormField(
                        controller: context.read<SignUpCubit>().emailController,

            keyboardType: TextInputType.emailAddress,
            validator: (val) {
              if (val!.isEmpty) {
                return "حقل البريد الالكتروني مطلوب";
              }
              return null;
            },
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
          ),
          verticalSpace(20),
          AppTextFormField(
                        controller: context.read<SignUpCubit>().phoneController,

            validator: (val) {
              if (val!.isEmpty) {
                return "حقل البريد الالكتروني مطلوب";
              }
              return null;
            },
            hint: "رقم الهاتف",
            keyboardType: TextInputType.phone,
            hintStyle: TextStyle(
                fontSize: HelperFunctions().getResponsiveFontSize(
                  context,
                  fontSize: 18,
                ),
                color: Colors.grey),
            suffixIcon: const Icon(Icons.phone_android_outlined),
          ),
          verticalSpace(20),
          AppTextFormField(
                                      controller: context.read<SignUpCubit>().passwordController,

            validator: (val) {

              if (val!.isEmpty) {
                return "حقل البريد الالكتروني مطلوب";
              }
              return null;
            },
            hint: "كلمة المرور",
            hintStyle: TextStyle(
                fontSize: HelperFunctions().getResponsiveFontSize(
                  context,
                  fontSize: 18,
                ),
                color: Colors.grey),
            obscureText: true,
            suffixIcon: const Icon(Icons.visibility_off),
          ),
          verticalSpace(20),
          AppTextFormField(
            validator: (val) {
              if (val!.isEmpty) {
                return "حقل البريد الالكتروني مطلوب";
              }
              return null;
            },
                                      controller: context.read<SignUpCubit>().confirmPasswordController,

            hint: "تأكيد كلمة المرور",
            hintStyle: TextStyle(
                fontSize: HelperFunctions().getResponsiveFontSize(
                  context,
                  fontSize: 18,
                ),
                color: Colors.grey),
            obscureText: true,
            suffixIcon: const Icon(Icons.visibility_off),
          ),
          verticalSpace(20),
          AppTextFormField(
                                      controller: context.read<SignUpCubit>().addressController,

            validator: (val) {
              if (val!.isEmpty) {
                return "حقل البريد الالكتروني مطلوب";
              }
              return null;
            },
            hint: "العنوان",
            hintStyle: TextStyle(
                fontSize: HelperFunctions().getResponsiveFontSize(
                  context,
                  fontSize: 18,
                ),
                color: Colors.grey),
            suffixIcon: const Icon(
              Icons.location_searching,
              color: AppColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
