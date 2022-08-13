import 'package:flutter/material.dart';

class ArticleAboutPage extends StatefulWidget {
  static String routeName = "/ArticleAboutPage";
  const ArticleAboutPage({Key? key}) : super(key: key);

  @override
  _ArticleAboutPageState createState() => _ArticleAboutPageState();
}

class _ArticleAboutPageState extends State<ArticleAboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Married Health v1.0.15"),),
    );
  }
}
