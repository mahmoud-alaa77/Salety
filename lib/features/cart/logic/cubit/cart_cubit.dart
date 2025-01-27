import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1intern/core/helper/hive_helper.dart';

import '../../data/models/hive_product_cart.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final HiveHelper hive;
  CartCubit(this.hive) : super(CartInitial());
  double totalPrice = 0;
  
  getAllCartProducts() async {
    emit(CartLoading());
    var result = await hive.getAllProductsInCart();
    result.fold((l) => emit(CartError(l.errorMessage)), (r) {
      for (var i = 0; i < r.length; i++) {
        totalPrice += r[i].price;
      }
      emit(CartLoaded(r));
    });
  }


  removeProductFromCart(HiveProductCart product) async {
    await hive.removeProductFromCart(product);
    getAllCartProducts();
  }
}
