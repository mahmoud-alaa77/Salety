import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task1intern/core/errors/failure.dart';
import 'package:task1intern/core/errors/server_failure.dart';

import '../../features/cart/data/models/hive_product_cart.dart';

class HiveHelper {
  Future<Either<Failure, List<HiveProductCart>>> getAllProductsInCart() async {
    try {
      final box = Hive.box('cart');
      return right(box.values.cast<HiveProductCart>().toList());
    } catch (error) {
      log("Error retrieving products from cart: $error");
      return left(ServerFailure(error.toString()));
    }
  }

  Future<Either<Failure, String>> checkAndUpdateOrAddProductToCart(
      HiveProductCart product) async {
    try {
      final box = Hive.box('cart');

      final existingProductKey = box.keys.firstWhere(
        (key) => box.get(key).id == product.id,
        orElse: () => null,
      );

      if (existingProductKey != null) {
        final existingProduct = box.get(existingProductKey) as HiveProductCart;
        final updatedProduct = HiveProductCart(
          id: existingProduct.id,
          description: existingProduct.description,
          name: existingProduct.name,
          imageUrl: existingProduct.imageUrl,
          price: existingProduct.price,
          quantity: existingProduct.quantity + product.quantity,
        );

        await box.put(existingProductKey, updatedProduct);
        log("Product quantity updated successfully: ${updatedProduct.name}");
        return right("Product quantity updated successfully");
      } else {
        await box.add(product);
        log("Product added to cart successfully: ${product.name}");
        return right("Product added to cart successfully");
      }
    } catch (error) {
      log("Error in checkAndUpdateOrAddProductToCart: $error");
      return left(ServerFailure(error.toString()));
    }
  }

  Future<Either<Failure, String>> removeProductFromCart(
      HiveProductCart product) async {
    try {
      final box = Hive.box('cart');
      final productKey = box.keys.firstWhere(
        (key) => box.get(key).id == product.id,
        orElse: () => null,
      );

      if (productKey != null) {
        await box.delete(productKey);
        log("Product removed from cart successfully: ${product.name}");
        return right("Product removed from cart successfully");
      } else {
        log("Product not found in cart to remove: ${product.name}");
        return right("Product not found in cart to remove");
      }
    } catch (error) {
      log("Error in removeProductFromCart: $error");
      return left(ServerFailure(error.toString()));
    }
  }
}
