import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:task1intern/features/home/data/models/product_model.dart';

class HiveHelper {
  void addProductToCart(ProductData product) async {
    await Hive.openBox('cart');

    final box = Hive.box('cart');

    await box.add(product);
    log("Product saved successfully! ${product.name}");
  }

  getAllProductsInCart() async {
    final box = Hive.box('cart');
    return box.values.cast<ProductData>().toList();
  }
}
