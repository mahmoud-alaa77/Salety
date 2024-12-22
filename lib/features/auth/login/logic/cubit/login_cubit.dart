import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1intern/core/helper/shared_pref_helpers.dart';
import 'package:task1intern/core/networking/dio_factory.dart';
import 'package:task1intern/features/auth/login/data/models/request_model.dart';
import 'package:task1intern/features/auth/login/data/models/response_model.dart';
import 'package:task1intern/features/auth/login/data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  emitLogin(RequestModel requestBody) async {
    emit(LoginLoading());

    final response = await loginRepo.login(requestBody);

    response.fold((failure) {
      emit(LoginError(errorMessage: failure.errorMessage));
    }, (responseModel) {
      saveUserToken(responseModel.data!.token.toString());
      emit(LoginSuccess(responseModel: responseModel));
    });
  }

  validateAndLogin() {
    if (formKey.currentState!.validate()) {
      emitLogin(
        RequestModel(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.saveDataByKey("token", token);
        //DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
