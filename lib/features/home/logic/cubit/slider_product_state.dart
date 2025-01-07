part of 'slider_product_cubit.dart';

sealed class SliderProductState {}

final class SliderProductInitial extends SliderProductState {}

final class SliderProductLoading extends SliderProductState {}

final class SliderProductError extends SliderProductState {
  final String message;

  SliderProductError({required this.message});
}

final class SliderProductLoaded extends SliderProductState {
  final SliderProductModel products;

  SliderProductLoaded({required this.products});
}
