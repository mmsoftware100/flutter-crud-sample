import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String photo;

  const Category({
    required this.id,
    required this.name,
    required this.photo
  });

  @override
  List<Object> get props => [id, name, photo];

  static  Category get sample => Category(id: 0, name: "name",photo: "endpoint");
}
