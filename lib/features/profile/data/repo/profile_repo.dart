import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task1intern/core/errors/failure.dart';
import 'package:task1intern/core/errors/server_failure.dart';
import 'package:task1intern/core/networking/api_service.dart';
import 'package:task1intern/features/profile/data/models/profile_response_model.dart';

class ProfileRepo {
  final ApiService apiService;

  ProfileRepo(this.apiService);

  Future<Either<Failure, ProfileResponseModel>> getProfile( ) async {
    try {
      final response = await apiService.getProfileData();
      return Right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
