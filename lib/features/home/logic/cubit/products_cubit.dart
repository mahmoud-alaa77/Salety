import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1intern/features/home/data/models/product_model.dart';
import 'package:task1intern/features/home/data/repo/home_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final HomeRepo homeRepo;
  ProductsCubit(this.homeRepo) : super(ProductsInitial());

  getAllProducts(int numPage) async {
    emit(ProductsLoading());

    final response = await homeRepo.getProducts(numPage);
    response.fold((failure) {
      emit(ProductsError(failure.errorMessage));
    }, (responseBody) {
      emit(ProductsLoaded(responseBody));
    });
  }
}
