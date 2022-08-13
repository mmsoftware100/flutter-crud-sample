import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/announcement.dart';

part 'announcement_model.g.dart';
@JsonSerializable(explicitToJson: true)

class AnnouncementModel {
  @JsonKey(name: 'art_id', defaultValue: "artId")
  String artId;

  @JsonKey(name: 'title', defaultValue: "artId")
  String title;

  @JsonKey(name: 'description', defaultValue: "description")
  String description;

  @JsonKey(name: 'content', defaultValue: "content")
  String content;

  @JsonKey(name: 'image', defaultValue: [])
  List<String> image;

  @JsonKey(name: 'announcement_pdf', defaultValue: [])
  List<String> announcementPdf;

  @JsonKey(name: 'style_css', defaultValue: "style_css")
  String styleCss;

  @JsonKey(name: 'resource', defaultValue: "artId")
  String resource;

  @JsonKey(name: 'language', defaultValue: "language")
  String language;

  @JsonKey(name: 'location', defaultValue: "location")
  String location;


  @JsonKey(name: 'create_date', defaultValue: "create_date")
  String createDate;

  @JsonKey(name: 'publish_date', defaultValue: "publish_date")
  String publishDate;

  @JsonKey(name: 'expire_date', defaultValue: "expire_date")
  String expireDate;

  @JsonKey(name: 'modified_date', defaultValue: "modified_date")
  String modifiedDate;

  @JsonKey(name: 'small_image_url', defaultValue: [])
  List<String> smallImageUrl;

  @JsonKey(name: 'small_image_width', defaultValue: "small_image_width")
  String smallImageWidth;

  @JsonKey(name: 'small_image_height', defaultValue: "small_image_height")
  String smallImageHeight;

  @JsonKey(name: 'small_image_type', defaultValue: "small_image_type")
  String smallImageType;

  @JsonKey(name: 'latest_time_query', defaultValue: "latest_time_query")
  String latestTimeQuery;

  AnnouncementModel({
        required this.artId,
        required this.title,
        required this.description,
        required this.content,
        required this.image,
        required this.announcementPdf,
        required this.styleCss,
        required this.resource,
        required this.language,
        required this.location,
        required this.createDate,
        required this.publishDate,
        required this.expireDate,
        required this.modifiedDate,
        required this.smallImageUrl,
        required this.smallImageWidth,
        required this.smallImageHeight,
        required this.smallImageType,
        required this.latestTimeQuery
  });


  Announcement toEntity(){
    return Announcement(artId: artId, title: title, description: description, content: content, image: image, announcementPdf: announcementPdf, styleCss: styleCss, resource: resource, language: language, location: location, createDate: createDate, publishDate: publishDate, expireDate: expireDate, modifiedDate: modifiedDate, smallImageUrl: smallImageUrl, smallImageWidth: smallImageWidth, smallImageHeight: smallImageHeight, smallImageType: smallImageType, latestTimeQuery: latestTimeQuery);

  }

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) =>  _$AnnouncementModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementModelToJson(this);

}