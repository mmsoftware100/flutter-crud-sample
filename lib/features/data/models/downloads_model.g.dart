// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownlaodsModel _$DownlaodsModelFromJson(Map<String, dynamic> json) =>
    DownlaodsModel(
      sDoolUrl: json['_dool_url'] as String? ?? '_dool_url',
      sDoolLang: json['_dool_lang'] as String? ?? '_dool_lang',
      sDoolSize: json['_dool_size'] as String? ?? '_dool_size',
      sDoolType: json['_dool_type'] as String? ?? '_dool_type',
      sDoolQuality: json['_dool_quality'] as String? ?? '_dool_quality',
      dtViewsCount: json['dt_views_count'] as String? ?? 'dt_views_count',
    );

Map<String, dynamic> _$DownlaodsModelToJson(DownlaodsModel instance) =>
    <String, dynamic>{
      '_dool_url': instance.sDoolUrl,
      '_dool_lang': instance.sDoolLang,
      '_dool_size': instance.sDoolSize,
      '_dool_type': instance.sDoolType,
      '_dool_quality': instance.sDoolQuality,
      'dt_views_count': instance.dtViewsCount,
    };
