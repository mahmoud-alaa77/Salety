import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1intern/features/favorites/data/models/fav_product_model.dart';
import 'package:task1intern/features/favorites/data/repo/favorites_repo.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepo favoritesRepo;
  FavoritesCubit(this.favoritesRepo) : super(FavoritesInitial());

  final List<int> favoriteProductsIds = [];
  getFavoriteProducts() async {
    emit(FavoritesLoading());
    final response = await favoritesRepo.getFavoriteProducts();

    response.fold((failure) {
      emit(FavoritesError(failure.errorMessage));
    }, (data) {
      emit(FavoritesLoaded(data));
      
    });
  }

  addOrDeleteProduct(int id) async {
    emit(FavoritesLoading());
    final response = await favoritesRepo.addToFavorites(id);
    response.fold((failure) {
      emit(FavoritesError(failure.errorMessage));
    }, (data) {
      emit(FavoriteProductAddOrDelete());
    });
  }

}
