
import '../../../data/const/data.dart';

class RepeatableFields {
  String name;
  String select;
  String idioma;
  String url;

  RepeatableFields({
    required this.name,
    required this.select,
    required this.idioma,
    required this.url
  });


  static RepeatableFields sample() => RepeatableFields(
      name: "name",
      select: "select",
      idioma: "idioma",
      url: repeatableFieldsUrl
  );

}