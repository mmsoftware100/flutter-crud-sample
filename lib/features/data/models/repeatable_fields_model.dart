import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/spt/repeatable_fields.dart';

part 'repeatable_fields_model.g.dart';
@JsonSerializable(explicitToJson: true)
class RepeatableFieldsModel {
  @JsonKey(name: 'name', defaultValue: "name")
  String name;

  @JsonKey(name: 'select', defaultValue: "select")
  String select;

  @JsonKey(name: 'idioma', defaultValue: "idioma")
  String idioma;

  @JsonKey(name: 'url', defaultValue: "url")
  String url;

  RepeatableFieldsModel({
    required this.name,
    required this.select,
    required this.idioma,
    required this.url
  });

  RepeatableFields toEntity(){
    return RepeatableFields(name: name, select: select, idioma: idioma, url: url);
  }

  factory RepeatableFieldsModel.fromJson(Map<String, dynamic> json) =>  _$RepeatableFieldsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RepeatableFieldsModelToJson(this);

}