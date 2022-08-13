import 'package:base/features/data/const/data.dart';
import 'package:base/features/presentation/components/our_text_input.dart';
import 'package:base/features/presentation/components/submit_button.dart';
import 'package:base/features/presentation/pages/binance/binance_bet_confirm_page.dart';
import 'package:base/features/presentation/providers/article_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/article.dart';


class ArticleDetailPage extends StatefulWidget {
  static String routeName = "/ArticleDetailPage";
  const ArticleDetailPage({Key? key}) : super(key: key);

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refresh();
  }

  void _refresh() async{

    //Provider.of<ArticleProvider>(context, listen: false).loadOfflineArticles();
    Provider.of<ArticleProvider>(context, listen: false).loadOnlineArticles();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName,),
        // title: Text(Provider.of<ArticleProvider>(context, listen: true).article.title, overflow: TextOverflow.ellipsis,),
      ),
      //body: SingleChildScrollView(child: _mainWidget()),
      body: _articleDetail(Provider.of<ArticleProvider>(context, listen: true).article),
    );
  }




  Widget _articleDetail(Article article){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16.0),
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
          SizedBox(height: 8.0,),
          Text(article.title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
          Divider(color: Colors.white,),
          Text(article.body, style: TextStyle(height: 2.0),),
          Divider(color: Colors.white,),
          ...article.comments.map((e) => Column(children: [Text(e), Divider(color: Colors.white,)],)).toList()
        ],
      ),
    );
  }

  Widget _articleThumbnail(Article article){
    return InkWell(
      onTap: (){
        // set article detail
        Provider.of<ArticleProvider>(context, listen: false).setArticle(article);
        // go to article detail page
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        child: Text(article.id.toString() +" "+ article.title),
      ),
    );
  }
}
