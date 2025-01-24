import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1intern/features/favorites/data/models/fav_product_model.dart';
import 'package:task1intern/features/favorites/data/repo/favorites_repo.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepo favoritesRepo;

  FavoritesCubit(this.favoritesRepo) : super(FavoritesInitial());

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
    final response = await favoritesRepo.addToFavorites(id);
    response.fold((failure) {
      emit(FavoritesError(failure.errorMessage));
    }, (data) {
      if (state is FavoritesLoaded) {
        final currentState = state as FavoritesLoaded;

        final updatedFavorites = currentState.favoriteProductModel;
        updatedFavorites.data!.removeWhere((item) => item.favId == id);

        emit(FavoritesLoaded(updatedFavorites));
      }
    });
  }
}
