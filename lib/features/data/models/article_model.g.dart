// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? 'title',
      body: json['body'] as String? ?? 'body',
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      photo: json['photo'] as String? ?? 'photo',
      categoryId: json['category_id'] as int? ?? 0,
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      favourite: json['favourite'] as bool? ?? false,
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'photo': instance.photo,
      'comments': instance.comments,
      'category_id': instance.categoryId,
      'category': instance.category?.toJson(),
      'favourite': instance.favourite,
    };
