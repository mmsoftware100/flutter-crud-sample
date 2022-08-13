// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
      iD: json['ID'] as String? ?? 'ID',
      postTitle: json['post_title'] as String? ?? 'post_title',
      postContent: json['post_content'] as String? ?? 'post_content',
      postType: json['post_type'] as String? ?? 'post_type',
      imagenes: (json['imagenes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      youtubeId: (json['youtube_id'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      dtPoster: json['dt_poster'] as String? ?? 'dt_poster',
      dtBackdrop: json['dt_backdrop'] as String? ?? 'dt_backdrop',
      imdbRating: json['imdbRating'] as String? ?? 'imdbRating',
      repeatableFields: (json['repeatable_fields'] as List<dynamic>?)
              ?.map((e) =>
                  RepeatableFieldsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      downloads: (json['downloads'] as List<dynamic>?)
              ?.map((e) => DownlaodsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      showData: (json['show_data'] as List<dynamic>?)
              ?.map((e) => ShowDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'ID': instance.iD,
      'post_title': instance.postTitle,
      'post_content': instance.postContent,
      'post_type': instance.postType,
      'imagenes': instance.imagenes,
      'youtube_id': instance.youtubeId,
      'dt_poster': instance.dtPoster,
      'dt_backdrop': instance.dtBackdrop,
      'imdbRating': instance.imdbRating,
      'repeatable_fields':
          instance.repeatableFields.map((e) => e.toJson()).toList(),
      'downloads': instance.downloads.map((e) => e.toJson()).toList(),
      'show_data': instance.showData.map((e) => e.toJson()).toList(),
    };
