import 'package:base/features/data/const/data.dart';
import 'package:base/features/presentation/components/our_text_input.dart';
import 'package:base/features/presentation/components/submit_button.dart';
import 'package:base/features/presentation/pages/article_detail_page.dart';
import 'package:base/features/presentation/pages/binance/binance_bet_confirm_page.dart';
import 'package:base/features/presentation/providers/article_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/article.dart';


class ArticleHomePage extends StatefulWidget {
  static String routeName = "/ArticleHomePage";
  const ArticleHomePage({Key? key}) : super(key: key);

  @override
  _ArticleHomePageState createState() => _ArticleHomePageState();
}

class _ArticleHomePageState extends State<ArticleHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _refresh();
  }

  void _refresh() async{
    Provider.of<ArticleProvider>(context, listen: false).loadOfflineArticles();
    //Provider.of<ArticleProvider>(context, listen: false).loadOnlineArticles();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      body: _articleList(Provider.of<ArticleProvider>(context, listen: true).articles),
      floatingActionButton: _fab(),
    );
  }

  Widget _fab(){
    return FloatingActionButton.extended(onPressed: (){
      _refresh();
    }, label: Text("Refresh"));
  }



  Widget _articleList(List<Article> articles){
    if(articles.isEmpty) return Center(child: Text("No Articles Available"),);
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => _articleThumbnail(articles[index]),
        separatorBuilder: (context, index) => Divider(),
        itemCount: articles.length
    );
  }

  Widget _articleThumbnail(Article article){
    return InkWell(
      onTap: (){
        // set article detail
        Provider.of<ArticleProvider>(context, listen: false).setArticle(article);
        // go to article detail page
        Navigator.pushNamed(context, ArticleDetailPage.routeName);
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.white)
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: CachedNetworkImage(
                imageUrl : article.photo,
                placeholder: (context, str) => Image.asset("assets/images/dolors.jpg"),
                errorWidget: (context, dyn, dyn2) => Image.asset("assets/images/dolors.jpg"), // Icon(Icons.error)
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(8.0),
              child: Text(article.id.toString() +" "+ article.title),
            ),
          ],
        ),
      ),
    );
  }
}
