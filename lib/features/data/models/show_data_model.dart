
import 'package:base/features/data/models/repeatable_fields_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'downloads_model.dart';

part 'show_data_model.g.dart';
@JsonSerializable(explicitToJson: true)
class ShowDataModel {
  @JsonKey(name: 'serie', defaultValue: "serie")
  String serie;

  @JsonKey(name: 'temporada', defaultValue: "temporada")
  String temporada;

  @JsonKey(name: 'episodio', defaultValue: "episodio")
  String episodio;

  @JsonKey(name: 'downloads', defaultValue: [])
  List<DownlaodsModel> downloads;

  /// TODO: in serialization plz catch String as empty array => json['repeatable_fields'].runtimeType == String ? [] :
  @JsonKey(name: 'repeatable_fields', defaultValue: [])
  List<RepeatableFieldsModel> repeatableFields;

  ShowDataModel({
    required this.serie,
    required this.temporada,
    required this.episodio,
    required this.downloads,
    required this.repeatableFields
  });


  factory ShowDataModel.fromJson(Map<String, dynamic> json) =>  _$ShowDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowDataModelToJson(this);

}