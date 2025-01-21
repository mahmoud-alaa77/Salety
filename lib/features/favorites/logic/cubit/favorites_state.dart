part of 'favorites_cubit.dart';

sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  final FavoriteProductModel favoriteProductModel;
  FavoritesLoaded(this.favoriteProductModel);
}

final class FavoritesError extends FavoritesState {
  final String errorMessage;
  FavoritesError(this.errorMessage);
}

final class FavoritesLoading extends FavoritesState {}


final class FavoriteProductAddOrDelete extends FavoritesState {}

final class IsFavoriteState extends FavoritesState {
  final bool isFavorite;
  IsFavoriteState({required this.isFavorite});
}