part of 'sign_up_cubit.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final SignUpResponseModel signUpResponseBody;

  SignUpSuccess({required this.signUpResponseBody});
}

class SignUpLoading extends SignUpState {}

class SignUpError extends SignUpState {
  final String errorMessage;

  SignUpError({required this.errorMessage});
}
