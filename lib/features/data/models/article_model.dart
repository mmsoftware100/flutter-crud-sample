import 'package:base/features/domain/entities/article.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/announcement.dart';
import '../../domain/entities/category.dart';
import 'category_model.dart';

part 'article_model.g.dart';
@JsonSerializable(explicitToJson: true)

class ArticleModel {
  @JsonKey(name: 'id', defaultValue: 0)
  int id;

  @JsonKey(name: 'title', defaultValue: "title")
  String title;

  @JsonKey(name: 'body', defaultValue: "body")
  String body;

  @JsonKey(name: 'photo', defaultValue: "photo")
  String photo;

  @JsonKey(name: 'comments', defaultValue: [])
  List<String> comments;

  @JsonKey(name: 'category_id', defaultValue: 0)
  int categoryId;

  @JsonKey(name: 'category', defaultValue: null)
  CategoryModel? category;

  @JsonKey(name: 'favourite', defaultValue: false)
  bool favourite;
  
  
  ArticleModel({
    required this.id,
    required this.title,
    required this.body,
    required this.comments,
    required this.photo,
    required this.categoryId,
    required this.category,
    required this.favourite
  });


  Article toEntity(){
    return Article(id: id, title: title, body: body, comments: comments, photo: photo, categoryId: categoryId, category: category == null ? Category.sample : category!.toEntity(), favourite: favourite);
  }

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>  _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);

}