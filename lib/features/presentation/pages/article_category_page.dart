import 'package:flutter/material.dart';

class ArticleCategoryPage extends StatefulWidget {
  static String routeName = "/ArticleCategoryPage";
  const ArticleCategoryPage({Key? key}) : super(key: key);

  @override
  _ArticleCategoryPageState createState() => _ArticleCategoryPageState();
}

class _ArticleCategoryPageState extends State<ArticleCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("No Category Available"),),
    );
  }
}
