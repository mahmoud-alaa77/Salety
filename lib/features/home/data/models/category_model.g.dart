// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      result: json['result'] as bool?,
      errorMessage: json['error_message'] as String?,
      errorMessageEn: json['error_message_en'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'error_message': instance.errorMessage,
      'error_message_en': instance.errorMessageEn,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      ord: (json['ord'] as num?)?.toInt(),
      type: json['type'] as String?,
      parentId: (json['parent_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      img: json['img'] as String?,
      details: json['details'] as String?,
      subCat: (json['sub_cat'] as List<dynamic>?)
          ?.map((e) => SubCat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'ord': instance.ord,
      'type': instance.type,
      'parent_id': instance.parentId,
      'name': instance.name,
      'img': instance.img,
      'details': instance.details,
      'sub_cat': instance.subCat,
    };

SubCat _$SubCatFromJson(Map<String, dynamic> json) => SubCat(
      id: (json['id'] as num?)?.toInt(),
      ord: (json['ord'] as num?)?.toInt(),
      type: json['type'] as String?,
      parentId: (json['parent_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      img: json['img'] as String?,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$SubCatToJson(SubCat instance) => <String, dynamic>{
      'id': instance.id,
      'ord': instance.ord,
      'type': instance.type,
      'parent_id': instance.parentId,
      'name': instance.name,
      'img': instance.img,
      'details': instance.details,
    };
