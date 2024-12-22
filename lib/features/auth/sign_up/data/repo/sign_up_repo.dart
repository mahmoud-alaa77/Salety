import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task1intern/core/errors/failure.dart';
import 'package:task1intern/core/errors/server_failure.dart';
import 'package:task1intern/core/networking/api_service.dart';
import 'package:task1intern/features/auth/sign_up/data/models/sign_up_request_model.dart';
import 'package:task1intern/features/auth/sign_up/data/models/sign_up_response_model.dart';

class SignUpRepo {
  final ApiService apiService;

  SignUpRepo(this.apiService);

  Future<Either<Failure, SignUpResponseModel>> signUp(
      SignUpRequestModel signUpRequestBody) async {
    try {
      final response = await apiService.signUp(signUpRequestBody);
      return Right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
