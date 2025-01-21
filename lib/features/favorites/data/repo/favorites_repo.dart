import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task1intern/core/errors/failure.dart';
import 'package:task1intern/core/errors/server_failure.dart';
import 'package:task1intern/core/networking/api_service.dart';
import 'package:task1intern/features/favorites/data/models/fav_product_model.dart';

class FavoritesRepo {
  final ApiService apiService;

  FavoritesRepo(this.apiService);

  Future<Either<Failure, FavoriteProductModel>> getFavoriteProducts() async {
    try {
      final response = await apiService.getFavoriteProducts();
      return right(response);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

  Future<Either<Failure, void>> addToFavorites(int productId) async {
    try {
      await apiService.addOrDeleteFavoriteProduct(productId);
      return right(null);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }


}
