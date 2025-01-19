// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UpperData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

UpperData _$UpperDataFromJson(Map<String, dynamic> json) => UpperData(
      currentPage: (json['current_page'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpperDataToJson(UpperData instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      type: (json['type'] as num?)?.toInt(),
      ord: (json['ord'] as num?)?.toInt(),
      isUsed: json['is_used'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      countryId: (json['country_id'] as num?)?.toInt(),
      brandId: (json['brand_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      nameEn: json['name_en'] as String?,
      details: json['details'] as String?,
      detailsEn: json['details_en'] as String?,
      colorId: (json['color_id'] as num?)?.toInt(),
      tag: json['tag'] as String?,
      price: json['price'] as String?,
      discount: (json['discount'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      notifiQuantity: (json['notifi_quantity'] as num?)?.toInt(),
      stokeId: (json['stoke_id'] as num?)?.toInt(),
      repositoryNumber: json['repository_number'] as String?,
      img: json['img'] as String?,
      productCode: json['product_code'] as String?,
      barcodeNumber: json['barcode_number'] as String?,
      weight: (json['weight'] as num?)?.toInt(),
      numViews: (json['num_views'] as num?)?.toInt(),
      isActive: json['is_active'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      priceAfterDiscount: (json['price_after_discount'] as num?)?.toInt(),
      isFavorite: (json['is_favorite'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'type': instance.type,
      'ord': instance.ord,
      'is_used': instance.isUsed,
      'category_id': instance.categoryId,
      'country_id': instance.countryId,
      'brand_id': instance.brandId,
      'name': instance.name,
      'name_en': instance.nameEn,
      'details': instance.details,
      'details_en': instance.detailsEn,
      'color_id': instance.colorId,
      'tag': instance.tag,
      'price': instance.price,
      'discount': instance.discount,
      'quantity': instance.quantity,
      'notifi_quantity': instance.notifiQuantity,
      'stoke_id': instance.stokeId,
      'repository_number': instance.repositoryNumber,
      'img': instance.img,
      'product_code': instance.productCode,
      'barcode_number': instance.barcodeNumber,
      'weight': instance.weight,
      'num_views': instance.numViews,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'price_after_discount': instance.priceAfterDiscount,
      'is_favorite': instance.isFavorite,
    };
