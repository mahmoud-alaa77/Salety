import 'package:json_annotation/json_annotation.dart';
part 'profile_response_model.g.dart';
@JsonSerializable()
class ProfileResponseModel {
  bool? status;
  String? message;
  Data? data;

  ProfileResponseModel({this.status, this.message, this.data});

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);
}

@JsonSerializable()
class Data {
  int? id;
  String? name;
  String? mobile;
  String? email;
  @JsonKey(name: "profile_photo_path")
  String? profilePhotoPath;
  @JsonKey(name: "role_id")
  int? roleId;
  @JsonKey(name: "profile_photo_url")
  String? profilePhotoUrl;

  Data(
      {this.id,
      this.name,
      this.mobile,
      this.email,
      this.profilePhotoPath,
      this.roleId,
      this.profilePhotoUrl});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
