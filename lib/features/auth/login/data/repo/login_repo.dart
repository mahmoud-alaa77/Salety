import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task1intern/core/errors/failure.dart';
import 'package:task1intern/core/networking/api_service.dart';
import 'package:task1intern/features/auth/login/data/models/request_model.dart';
import 'package:task1intern/features/auth/login/data/models/response_model.dart';

import '../../../../../core/errors/server_failure.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo(this.apiService);

  Future<Either<Failure, ResponseModel>> login(
      RequestModel requestModel) async {
    try {
      final response = await apiService.login(requestModel);
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
