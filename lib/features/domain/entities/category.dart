import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String photo;
  final int count;

  const Category({
    required this.id,
    required this.name,
    required this.photo,
    required this.count
  });

  @override
  List<Object> get props => [id, name, photo, count];

  static  Category get sample => Category(id: 0, name: "name",photo: "endpoint", count: 0);
}
