
import 'package:base/features/domain/entities/category.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/dreamcatcher/ticket_status.dart';

part 'category_model.g.dart';
@JsonSerializable(explicitToJson: true)
class CategoryModel {

  @JsonKey(name: 'id', defaultValue: 0)
  int id;

  @JsonKey(name: 'name', defaultValue: "name")
  String name;

  @JsonKey(name: 'photo', defaultValue: "photo")
  String photo;

  @JsonKey(name: 'count', defaultValue: 0)
  int count;

  CategoryModel({
    required this.id,
    required this.name,
    required this.photo,
    required this.count
  });

  Category toEntity(){
    return Category(id: id, name: name, photo: photo, count: count);
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>  _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

}