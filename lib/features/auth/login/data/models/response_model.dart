import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';
@JsonSerializable()
class ResponseModel {
  bool? status;
  String? message;
  Data? data;

  ResponseModel({this.status, this.message, this.data});

 factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

        Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
@JsonSerializable()

class Data {
  int? id;
  String? name;
  String? mobile;
  String? email;
  int? roleId;
  String? address;
  String? profilePhotoPath;
  String? token;
  String? profilePhotoUrl;

  Data(
      {this.id,
      this.name,
      this.mobile,
      this.email,
      this.roleId,
      this.address,
      this.profilePhotoPath,
      this.token,
      this.profilePhotoUrl});

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);
}