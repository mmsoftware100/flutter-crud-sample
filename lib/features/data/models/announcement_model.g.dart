// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementModel _$AnnouncementModelFromJson(Map<String, dynamic> json) =>
    AnnouncementModel(
      artId: json['art_id'] as String? ?? 'artId',
      title: json['title'] as String? ?? 'artId',
      description: json['description'] as String? ?? 'description',
      content: json['content'] as String? ?? 'content',
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      announcementPdf: (json['announcement_pdf'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      styleCss: json['style_css'] as String? ?? 'style_css',
      resource: json['resource'] as String? ?? 'artId',
      language: json['language'] as String? ?? 'language',
      location: json['location'] as String? ?? 'location',
      createDate: json['create_date'] as String? ?? 'create_date',
      publishDate: json['publish_date'] as String? ?? 'publish_date',
      expireDate: json['expire_date'] as String? ?? 'expire_date',
      modifiedDate: json['modified_date'] as String? ?? 'modified_date',
      smallImageUrl: (json['small_image_url'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      smallImageWidth:
          json['small_image_width'] as String? ?? 'small_image_width',
      smallImageHeight:
          json['small_image_height'] as String? ?? 'small_image_height',
      smallImageType: json['small_image_type'] as String? ?? 'small_image_type',
      latestTimeQuery:
          json['latest_time_query'] as String? ?? 'latest_time_query',
    );

Map<String, dynamic> _$AnnouncementModelToJson(AnnouncementModel instance) =>
    <String, dynamic>{
      'art_id': instance.artId,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'image': instance.image,
      'announcement_pdf': instance.announcementPdf,
      'style_css': instance.styleCss,
      'resource': instance.resource,
      'language': instance.language,
      'location': instance.location,
      'create_date': instance.createDate,
      'publish_date': instance.publishDate,
      'expire_date': instance.expireDate,
      'modified_date': instance.modifiedDate,
      'small_image_url': instance.smallImageUrl,
      'small_image_width': instance.smallImageWidth,
      'small_image_height': instance.smallImageHeight,
      'small_image_type': instance.smallImageType,
      'latest_time_query': instance.latestTimeQuery,
    };
