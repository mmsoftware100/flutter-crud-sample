// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowDataModel _$ShowDataModelFromJson(Map<String, dynamic> json) =>
    ShowDataModel(
      serie: json['serie'] as String? ?? 'serie',
      temporada: json['temporada'] as String? ?? 'temporada',
      episodio: json['episodio'] as String? ?? 'episodio',
      downloads: (json['downloads'] as List<dynamic>?)
              ?.map((e) => DownlaodsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      repeatableFields: (json['repeatable_fields'] as List<dynamic>?)
              ?.map((e) =>
                  RepeatableFieldsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ShowDataModelToJson(ShowDataModel instance) =>
    <String, dynamic>{
      'serie': instance.serie,
      'temporada': instance.temporada,
      'episodio': instance.episodio,
      'downloads': instance.downloads.map((e) => e.toJson()).toList(),
      'repeatable_fields':
          instance.repeatableFields.map((e) => e.toJson()).toList(),
    };
