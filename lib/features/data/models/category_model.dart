import 'package:base/features/data/models/downloads_model.dart';
import 'package:base/features/data/models/repeatable_fields_model.dart';
import 'package:base/features/data/models/show_data_model.dart';
import 'package:base/features/data/models/ticket_status_model.dart';
import 'package:base/features/domain/entities/category.dart';
import 'package:base/features/domain/entities/dreamcatcher/ticket.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/dreamcatcher/ticket_status.dart';
import '../../domain/entities/spt/video.dart';

part 'category_model.g.dart';
@JsonSerializable(explicitToJson: true)
class CategoryModel {

  @JsonKey(name: 'id', defaultValue: 0)
  int id;

  @JsonKey(name: 'name', defaultValue: "name")
  String name;

  @JsonKey(name: 'photo', defaultValue: "photo")
  String photo;

  CategoryModel({
    required this.id,
    required this.name,
    required this.photo
  });

  Category toEntity(){
    return Category(id: id, name: name, photo: photo);
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>  _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

}