import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  bool? status;
  String? message;
  UpperData? data;

  ProductModel({this.status, this.message, this.data});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class UpperData {
  @JsonKey(name: "current_page")
  int? currentPage;
  List<Data>? data;

  UpperData({
    this.currentPage,
    this.data,
  });
  factory UpperData.fromJson(Map<String, dynamic> json) =>
      _$UpperDataFromJson(json);

  Map<String, dynamic> toJson() => _$UpperDataToJson(this);
}

@JsonSerializable()
class Data {
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
  String? price;
  int? discount;
  int? quantity;
  @JsonKey(name: "notifi_quantity")
  int? notifiQuantity;
  @JsonKey(name: "stoke_id")
  int? stokeId;
  @JsonKey(name: "repository_number")
  String? repositoryNumber;
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
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "price_after_discount")
  int? priceAfterDiscount;
  @JsonKey(name: "is_favorite")
  int? isFavorite;

  Data({
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
    this.price,
    this.discount,
    this.quantity,
    this.notifiQuantity,
    this.stokeId,
    this.repositoryNumber,
    this.img,
    this.productCode,
    this.barcodeNumber,
    this.weight,
    this.numViews,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.priceAfterDiscount,
    this.isFavorite,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}






/*
0000000000000000000000000
*/



