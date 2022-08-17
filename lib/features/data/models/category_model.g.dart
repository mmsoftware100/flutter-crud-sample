// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'name',
      photo: json['photo'] as String? ?? 'photo',
      count: json['count'] as int? ?? 0,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'count': instance.count,
    };
