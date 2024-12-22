

import 'package:json_annotation/json_annotation.dart';
part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  bool? status;
  @JsonKey(name: "error_message")
  String? errorMessage;
  @JsonKey(name: "error_message_en")
  String? errorMessageEn;
  Data? data;

  SignUpResponseModel(
      {this.status, this.errorMessage, this.errorMessageEn, this.data});

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  String? mobile;
  String? name;
  String? email;
  String? address;
  String? profilePhotoPath;
  String? token;

  Data(
      {this.mobile,
      this.name,
      this.email,
      this.address,
      this.profilePhotoPath,
      this.token});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
