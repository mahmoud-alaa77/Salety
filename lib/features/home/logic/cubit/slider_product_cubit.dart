import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1intern/features/home/data/models/slider_products_model.dart';
import 'package:task1intern/features/home/data/repo/home_repo.dart';

part 'slider_product_state.dart';

class SliderProductCubit extends Cubit<SliderProductState> {
  final HomeRepo homeRepo;
  SliderProductCubit(this.homeRepo) : super(SliderProductInitial());

  getSliderProducts() async {
    emit(SliderProductLoading());

    final response = await homeRepo.getSliderProducts();
    response.fold((failure) {
      emit(SliderProductError(message: failure.errorMessage));
    }, (responseBody) {
      emit(SliderProductLoaded(products: responseBody));
    });
  }
}
