import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1intern/features/home/data/models/category_model.dart';
import 'package:task1intern/features/home/data/repo/home_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeRepo homeRepo;
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());

  getCategories() async {
    emit(CategoriesLoading());

    final response = await homeRepo.getCategories();
    response.fold((failure) {
      emit(CategoriesError(error: failure.errorMessage));
    }, (responseBody) {
      emit(CategoriesLoaded(categories: responseBody));
    });
  }
}
