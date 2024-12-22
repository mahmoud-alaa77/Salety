import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1intern/features/auth/sign_up/data/models/sign_up_request_model.dart';
import 'package:task1intern/features/auth/sign_up/data/models/sign_up_response_model.dart';
import 'package:task1intern/features/auth/sign_up/data/repo/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo signUpRepo;
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignUp(SignUpRequestModel requestBody) async {
    emit(SignUpLoading());

    final response = await signUpRepo.signUp(requestBody);

    response.fold((failure) {
      emit(SignUpError(errorMessage: failure.errorMessage));
    }, (responseBody) {
      emit(SignUpSuccess(signUpResponseBody: responseBody));
    });
  }

  void validateAndSignUp() {
    if (formKey.currentState!.validate()) {
      emitSignUp(SignUpRequestModel(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
          mobile: phoneController.text,
          address: addressController.text));
    }
  }
}
