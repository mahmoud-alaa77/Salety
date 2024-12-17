part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final ResponseModel responseModel;

  LoginSuccess({required this.responseModel});
}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  final String errorMessage;

  LoginError({required this.errorMessage});
}
