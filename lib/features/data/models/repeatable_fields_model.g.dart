// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repeatable_fields_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepeatableFieldsModel _$RepeatableFieldsModelFromJson(
        Map<String, dynamic> json) =>
    RepeatableFieldsModel(
      name: json['name'] as String? ?? 'name',
      select: json['select'] as String? ?? 'select',
      idioma: json['idioma'] as String? ?? 'idioma',
      url: json['url'] as String? ?? 'url',
    );

Map<String, dynamic> _$RepeatableFieldsModelToJson(
        RepeatableFieldsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'select': instance.select,
      'idioma': instance.idioma,
      'url': instance.url,
    };
