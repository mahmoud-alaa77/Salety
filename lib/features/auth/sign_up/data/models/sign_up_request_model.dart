import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request_model.g.dart';

@JsonSerializable()
class SignUpRequestModel {
  final String name;
  final String email;
  final String password;
  @JsonKey(name: "c_password")
  final String confirmPassword;
  final String mobile;
  final String address;

  SignUpRequestModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.mobile,
      required this.address});

        Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);

}
