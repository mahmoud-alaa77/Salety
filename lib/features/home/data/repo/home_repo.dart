import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task1intern/core/errors/failure.dart';
import 'package:task1intern/core/errors/server_failure.dart';
import 'package:task1intern/core/helper/shared_pref_helpers.dart';
import 'package:task1intern/core/networking/api_service.dart';
import 'package:task1intern/features/home/data/models/category_model.dart';
import 'package:task1intern/features/home/data/models/product_model.dart';
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

  Future<Either<Failure, CategoryModel>> getCategories() async {
    try {
      final response = await apiService.getCategories();
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

  Future<Either<Failure, ProductModel>> getProducts(int pageNumber) async {
    try {
      final response = await apiService.getAllProducts(pageNumber, await SharedPrefHelper.getInt("userId"));
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
