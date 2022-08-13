// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spt_meta_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SptMetaDataModel _$SptMetaDataModelFromJson(Map<String, dynamic> json) =>
    SptMetaDataModel(
      termTaxonomyId: json['term_taxonomy_id'] as String? ?? 'term_taxonomy_id',
      taxonomy: json['taxonomy'] as String? ?? 'taxonomy',
      termId: json['term_id'] as String? ?? 'term_id',
      name: json['name'] as String? ?? 'name',
    );

Map<String, dynamic> _$SptMetaDataModelToJson(SptMetaDataModel instance) =>
    <String, dynamic>{
      'term_taxonomy_id': instance.termTaxonomyId,
      'taxonomy': instance.taxonomy,
      'term_id': instance.termId,
      'name': instance.name,
    };
