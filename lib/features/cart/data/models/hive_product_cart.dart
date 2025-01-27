import 'package:hive_flutter/hive_flutter.dart';

part 'hive_product_cart.g.dart';

@HiveType(typeId: 0)
class HiveProductCart extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final String imageUrl;

  @HiveField(5)
  int quantity;

  HiveProductCart({
    required this.id,
    required this.quantity,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
}
