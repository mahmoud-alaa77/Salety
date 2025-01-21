// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteProductModel _$FavoriteProductModelFromJson(
        Map<String, dynamic> json) =>
    FavoriteProductModel(
      result: json['result'] as bool?,
      errorMessage: json['errorMessage'] as String?,
      errorMessageEn: json['errorMessageEn'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FavoriteProductModelToJson(
        FavoriteProductModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'errorMessage': instance.errorMessage,
      'errorMessageEn': instance.errorMessageEn,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      favId: (json['favo_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'favo_id': instance.favId,
      'product': instance.product,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
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
      tagEn: json['tag_en'] as String?,
      price: json['price'] as String?,
      discount: (json['discount'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      notifiQuantity: (json['notifi_quantity'] as num?)?.toInt(),
      stokeId: (json['stoke_id'] as num?)?.toInt(),
      img: json['img'] as String?,
      productCode: json['product_code'] as String?,
      barcodeNumber: json['barcode_number'] as String?,
      weight: (json['weight'] as num?)?.toInt(),
      numViews: (json['num_views'] as num?)?.toInt(),
      isActive: json['is_active'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
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
      'tag_en': instance.tagEn,
      'price': instance.price,
      'discount': instance.discount,
      'quantity': instance.quantity,
      'notifi_quantity': instance.notifiQuantity,
      'stoke_id': instance.stokeId,
      'img': instance.img,
      'product_code': instance.productCode,
      'barcode_number': instance.barcodeNumber,
      'weight': instance.weight,
      'num_views': instance.numViews,
      'is_active': instance.isActive,
    };
