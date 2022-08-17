
import 'package:json_annotation/json_annotation.dart';

part 'downloads_model.g.dart';
@JsonSerializable(explicitToJson: true)
class DownlaodsModel {
  @JsonKey(name: '_dool_url', defaultValue: "_dool_url")
  String sDoolUrl;

  @JsonKey(name: '_dool_lang', defaultValue: "_dool_lang")
  String sDoolLang;

  @JsonKey(name: '_dool_size', defaultValue: "_dool_size")
  String sDoolSize;

  @JsonKey(name: '_dool_type', defaultValue: "_dool_type")
  String sDoolType;

  @JsonKey(name: '_dool_quality', defaultValue: "_dool_quality")
  String sDoolQuality;

  @JsonKey(name: 'dt_views_count', defaultValue: "dt_views_count")
  String dtViewsCount;

  DownlaodsModel({
    required this.sDoolUrl,
    required this.sDoolLang,
    required this.sDoolSize,
    required this.sDoolType,
    required this.sDoolQuality,
    required this.dtViewsCount
  });


  factory DownlaodsModel.fromJson(Map<String, dynamic> json) =>  _$DownlaodsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DownlaodsModelToJson(this);
}
