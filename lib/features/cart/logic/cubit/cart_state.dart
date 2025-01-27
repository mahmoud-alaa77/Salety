part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoaded extends CartState {
  final List<HiveProductCart> cartProducts;
  CartLoaded(this.cartProducts);
}

final class CartLoading extends CartState {}

final class CartError extends CartState {
  final String errorMessage;
  CartError(this.errorMessage);
}
