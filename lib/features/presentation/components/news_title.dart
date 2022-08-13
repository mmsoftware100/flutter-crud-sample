import 'package:flutter/material.dart';

class NewsTitle extends StatelessWidget {
  final String title;
  const NewsTitle({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),);
  }
}
