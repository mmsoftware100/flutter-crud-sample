// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestNewsModel _$LatestNewsModelFromJson(Map<String, dynamic> json) =>
    LatestNewsModel(
      artId: json['artId'] as String? ?? 'artId',
      title: json['title'] as String? ?? 'title',
      description: json['description'] as String? ?? 'description',
      content: json['content'] as String? ?? 'content',
      video:
          (json['video'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      pdf: (json['pdf'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
      publishDate: json['published_date'] as String? ?? 'published_date',
    );

Map<String, dynamic> _$LatestNewsModelToJson(LatestNewsModel instance) =>
    <String, dynamic>{
      'artId': instance.artId,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'image': instance.image,
      'pdf': instance.pdf,
      'video': instance.video,
      'published_date': instance.publishDate,
    };
