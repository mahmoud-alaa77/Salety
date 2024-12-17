import 'package:json_annotation/json_annotation.dart';
part 'request_model.g.dart';

@JsonSerializable()
class RequestModel {
  @JsonKey(name: 'phone_email')
  final String email;
  final String password;

  RequestModel(
      {required this.email, required this.password,});


  Map<String, dynamic> toJson() => _$RequestModelToJson(this);

}
