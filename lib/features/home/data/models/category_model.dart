import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  bool? result;
  @JsonKey(name: 'error_message')
  String? errorMessage;
  @JsonKey(name: 'error_message_en')
  String? errorMessageEn;
  List<Data>? data;

  CategoryModel(
      {this.result, this.errorMessage, this.errorMessageEn, this.data});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class Data {
  int? id;
  int? ord;
  String? type;
  @JsonKey(name: 'parent_id')
  int? parentId;
  String? name;
  String? img;
  String? details;
  @JsonKey(name: 'sub_cat')
  List<SubCat>? subCat;

  Data(
      {this.id,
      this.ord,
      this.type,
      this.parentId,
      this.name,
      this.img,
      this.details,
      this.subCat});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class SubCat {
  int? id;
  int? ord;
  String? type;
  @JsonKey(name: 'parent_id')
  int? parentId;
  String? name;
  String? img;
  String? details;

  SubCat(
      {this.id,
      this.ord,
      this.type,
      this.parentId,
      this.name,
      this.img,
      this.details});
  factory SubCat.fromJson(Map<String, dynamic> json) => _$SubCatFromJson(json);

  Map<String, dynamic> toJson() => _$SubCatToJson(this);
}
