import 'package:base/features/domain/entities/category.dart';
import 'package:base/features/domain/entities/dreamcatcher/ticket_status.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Article{
  int id;
  String title;
  String body;
  List<String> comments;
  String photo;
  int categoryId;
  Category category;
  bool favourite;

  Article({
    required this.id,
    required this.title,
    required this.body,
    required this.comments,
    required this.photo,
    required this.categoryId,
    required this.category,
    required this.favourite
  });

  static Article get sample  => Article(id: 0, title: "title", body: "body", comments: [], photo: "photo.jpg", categoryId: Category.sample.id, category: Category.sample, favourite: false);
}
