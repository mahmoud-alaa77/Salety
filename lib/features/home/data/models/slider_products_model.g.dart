// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderProductModel _$SliderProductModelFromJson(Map<String, dynamic> json) =>
    SliderProductModel(
      result: json['result'] as bool?,
      errorMessage: json['error_message'] as String?,
      errorMessageEn: json['error_message_en'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SliderProductModelToJson(SliderProductModel instance) =>
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
      name: json['name'] as String?,
      img: json['img'] as String?,
      urlL: json['url_l'] as String?,
      withId: (json['with_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'ord': instance.ord,
      'type': instance.type,
      'name': instance.name,
      'img': instance.img,
      'url_l': instance.urlL,
      'with_id': instance.withId,
    };
