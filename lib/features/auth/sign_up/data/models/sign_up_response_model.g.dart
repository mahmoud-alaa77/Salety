// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponseModel _$SignUpResponseModelFromJson(Map<String, dynamic> json) =>
    SignUpResponseModel(
      status: json['status'] as bool?,
      errorMessage: json['error_message'] as String?,
      errorMessageEn: json['error_message_en'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpResponseModelToJson(
        SignUpResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'error_message': instance.errorMessage,
      'error_message_en': instance.errorMessageEn,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      mobile: json['mobile'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      profilePhotoPath: json['profilePhotoPath'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'mobile': instance.mobile,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'profilePhotoPath': instance.profilePhotoPath,
      'token': instance.token,
    };
