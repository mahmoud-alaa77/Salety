import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task1intern/core/errors/failure.dart';
import 'package:task1intern/core/errors/server_failure.dart';
import 'package:task1intern/core/networking/api_service.dart';
import 'package:task1intern/features/home/data/models/slider_products_model.dart';

class HomeRepo {
  final ApiService apiService;

  HomeRepo(this.apiService);

  Future<Either<Failure, SliderProductModel>> getSliderProducts() async {
    try {
      final response = await apiService.getSliderProducts();
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
