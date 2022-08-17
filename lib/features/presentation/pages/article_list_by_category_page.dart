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


class ArticleListByCategoryPage extends StatefulWidget {
  static String routeName = "/ArticleListByCategoryPage";
  const ArticleListByCategoryPage({Key? key}) : super(key: key);

  @override
  _ArticleListByCategoryPageState createState() => _ArticleListByCategoryPageState();
}

class _ArticleListByCategoryPageState extends State<ArticleListByCategoryPage> {
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _refresh();
    // _loadOffline();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(Provider.of<ArticleProvider>(context, listen: false).category.name),
      ),

      body: _articleList(Provider.of<ArticleProvider>(context, listen: false).getArticlesByCategory(Provider.of<ArticleProvider>(context, listen: false).category)),
      // floatingActionButton: _fab(),
    );
  }

  Widget _fab(){
    return FloatingActionButton.extended(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.refresh),
        label: Text("Back")
    );
  }



  Widget _loadingWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: MediaQuery.of(context).size.width,),
        CircularProgressIndicator(color: Colors.white,),
        SizedBox(height: 20,),
        Text("Offline တွင်ဖတ်ရှုနိုင်ရန်အတွက်\nစက္ကန့် (၃၀) ခန့် စောင့်ဆိုင်းပေးပါ၊"),
      ],
    );
  }
  Widget _articleList(List<Article> articles){
    if(articles.isEmpty && loading == true) return _loadingWidget();
    if(articles.isEmpty) return _noArticleWidget();
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => _articleThumbnail(articles[index]),
        separatorBuilder: (context, index) => Divider(),
        itemCount: articles.length
    );
  }

  Widget _noArticleWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: MediaQuery.of(context).size.width,),
        Text("No Articles Available\n အခြား Category ကို ရွေးချယ်ပါ"),
        SizedBox(height: 20,),
        _fab()
      ],
    );
  }


  Widget _loadingArticles(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: MediaQuery.of(context).size.width,),
        CircularProgressIndicator(color: Colors.white,),
        SizedBox(height: 20,),
        Text("Loading"),
      ],
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
            Hero(
              tag: article.id.toString(),
              child: ClipRRect(
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
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(8.0),
              child: Text(article.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
