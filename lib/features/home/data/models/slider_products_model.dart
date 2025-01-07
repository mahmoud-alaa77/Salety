
import 'package:json_annotation/json_annotation.dart';
part 'slider_products_model.g.dart';
@JsonSerializable()
class SliderProductModel {
  bool? result;
  @JsonKey(name: 'error_message')
  String? errorMessage;
  @JsonKey(name: 'error_message_en')
  String? errorMessageEn;
  List<Data>? data;

  SliderProductModel(
      {this.result, this.errorMessage, this.errorMessageEn, this.data});

 
  factory SliderProductModel.fromJson(Map<String, dynamic> json) => _$SliderProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$SliderProductModelToJson(this);
}
@JsonSerializable()
class Data {
  int? id;
  int? ord;
  String? type;
  String? name;
  String? img;
  @JsonKey(name: 'url_l')
  String? urlL;
  @JsonKey(name: 'with_id')
  int? withId;

  Data(
      {this.id,
      this.ord,
      this.type,
      this.name,
      this.img,
      this.urlL,
      this.withId});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}