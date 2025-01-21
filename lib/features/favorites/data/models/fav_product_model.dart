import 'package:json_annotation/json_annotation.dart';
part 'fav_product_model.g.dart';

@JsonSerializable()
class FavoriteProductModel {
  bool? result;
  String? errorMessage;
  String? errorMessageEn;
  List<Data>? data;

  FavoriteProductModel(
      {this.result, this.errorMessage, this.errorMessageEn, this.data});

  factory FavoriteProductModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteProductModelToJson(this);
}

@JsonSerializable()
class Data {
  int? id;
  @JsonKey(name: "favo_id")
  int? favId;
  Product? product;

  Data({this.id, this.product,this.favId});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Product {
  int? id;
  @JsonKey(name: "user_id")
  int? userId;
  int? type;
  int? ord;
  @JsonKey(name: "is_used")
  String? isUsed;
  @JsonKey(name: "category_id")
  int? categoryId;
  @JsonKey(name: "country_id")
  int? countryId;
  @JsonKey(name: "brand_id")
  int? brandId;
  String? name;
  @JsonKey(name: "name_en")
  String? nameEn;
  String? details;
  @JsonKey(name: "details_en")
  String? detailsEn;
  @JsonKey(name: "color_id")
  int? colorId;
  String? tag;
  @JsonKey(name: "tag_en")
  String? tagEn;
  String? price;
  int? discount;
  int? quantity;
  @JsonKey(name: "notifi_quantity")
  int? notifiQuantity;
  @JsonKey(name: "stoke_id")
  int? stokeId;
  String? img;
  @JsonKey(name: "product_code")
  String? productCode;

  @JsonKey(name: "barcode_number")
  String? barcodeNumber;
  int? weight;
  @JsonKey(name: "num_views")
  int? numViews;
  @JsonKey(name: "is_active")
  String? isActive;

  Product({
    this.id,
    this.userId,
    this.type,
    this.ord,
    this.isUsed,
    this.categoryId,
    this.countryId,
    this.brandId,
    this.name,
    this.nameEn,
    this.details,
    this.detailsEn,
    this.colorId,
    this.tag,
    this.tagEn,
    this.price,
    this.discount,
    this.quantity,
    this.notifiQuantity,
    this.stokeId,
    this.img,
    this.productCode,
    this.barcodeNumber,
    this.weight,
    this.numViews,
    this.isActive,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
