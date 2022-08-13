import 'package:flutter/material.dart';

class PublishedDate extends StatelessWidget {
  final String publishedDate;
  const PublishedDate({
    Key? key,
    required this.publishedDate
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(publishedDate, style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 14),);
  }
}
