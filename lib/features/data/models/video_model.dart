import 'package:base/features/data/models/downloads_model.dart';
import 'package:base/features/data/models/repeatable_fields_model.dart';
import 'package:base/features/data/models/show_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/spt/video.dart';

part 'video_model.g.dart';
@JsonSerializable(explicitToJson: true)
class VideoModel {

  @JsonKey(name: 'ID', defaultValue: "ID")
  String iD;

  @JsonKey(name: 'post_title', defaultValue: "post_title")
  String postTitle;

  @JsonKey(name: 'post_content', defaultValue: "post_content")
  String postContent;

  @JsonKey(name: 'post_type', defaultValue: "post_type")
  String postType;

  @JsonKey(name: 'imagenes', defaultValue: [])
  List<String> imagenes;

  @JsonKey(name: 'youtube_id', defaultValue: [])
  List<String> youtubeId;

  @JsonKey(name: 'dt_poster', defaultValue: "dt_poster")
  String dtPoster;

  @JsonKey(name: 'dt_backdrop', defaultValue: "dt_backdrop")
  String dtBackdrop;

  @JsonKey(name: 'imdbRating', defaultValue: "imdbRating")
  String imdbRating;

  @JsonKey(name: 'repeatable_fields', defaultValue: [])
  List<RepeatableFieldsModel> repeatableFields;

  @JsonKey(name: 'downloads', defaultValue: [])
  List<DownlaodsModel> downloads;

  @JsonKey(name: 'show_data', defaultValue: [])
  List<ShowDataModel> showData;



  VideoModel({
    required this.iD,
    required this.postTitle,
    required this.postContent,
    required this.postType,
    required this.imagenes,
    required this.youtubeId,
    required this.dtPoster,
    required this.dtBackdrop,
    required this.imdbRating,
    required this.repeatableFields,
    required this.downloads,
    required this.showData
  });

  Video toEntity(){
    return Video(
        iD: iD,
        postTitle: postTitle,
        postContent: postContent,
        postType: postType,
        imagenes: imagenes,
        youtubeId: youtubeId,
        dtPoster: dtPoster,
        dtBackdrop: dtBackdrop,
        imdbRating: imdbRating,
        repeatableFields: repeatableFields.map((e) => e.toEntity()).toList(),
        downloads: downloads.map((e) => e.toEntity()).toList(),
        showData: showData.map((e) => e.toEntity()).toList()
    );
  }

  factory VideoModel.fromJson(Map<String, dynamic> json) =>  _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);

}