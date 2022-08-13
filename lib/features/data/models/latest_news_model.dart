
import 'package:base/features/domain/entities/latest_news.dart';
import 'package:flutter/rendering.dart';
import 'package:json_annotation/json_annotation.dart';

import '../const/data.dart';

part 'latest_news_model.g.dart';
@JsonSerializable(explicitToJson: true)
class LatestNewsModel {

  @JsonKey(name: 'artId', defaultValue: "artId")
  String artId;

  @JsonKey(name: 'title', defaultValue: "title")
  String title;

  @JsonKey(name: 'description', defaultValue: "description")
  String description;

  @JsonKey(name: 'content', defaultValue: "content")
  String content;

  @JsonKey(name: 'image', defaultValue: [])
  List<String> image;

  @JsonKey(name: 'pdf', defaultValue: [])
  List<String> pdf;

  @JsonKey(name: 'video', defaultValue: [])
  List<String> video;

  @JsonKey(name: 'published_date', defaultValue: "published_date")
  String publishDate;


  LatestNewsModel(
      {
        required this.artId,
        required this.title,
        required this.description,
        required this.content,
        required this.video,
        required this.image,
        required this.pdf,
        required this.publishDate
      });


  factory LatestNewsModel.fromJson(Map<String, dynamic> json) =>  _$LatestNewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$LatestNewsModelToJson(this);


  LatestNews toEntity(){
    return LatestNews(
        id: artId,
        title: title,
        subtitle: description,
        content: content,
        pdf: pdf.isEmpty ? "" : pdf.first,
        image: image.isEmpty ? imagePlaceholder : image.first,
        video: video.isEmpty ? "" : video.first,
        publishDate: publishDate,
        videos: video,
        images: image,
        pdfs: pdf
    );
  }

}