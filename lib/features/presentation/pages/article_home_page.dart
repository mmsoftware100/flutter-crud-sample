import 'package:base/features/data/const/data.dart';
import 'package:base/features/presentation/components/our_text_input.dart';
import 'package:base/features/presentation/components/submit_button.dart';
import 'package:base/features/presentation/pages/article_about_page.dart';
import 'package:base/features/presentation/pages/article_category_page.dart';
import 'package:base/features/presentation/pages/article_detail_page.dart';
import 'package:base/features/presentation/pages/article_favourite_page.dart';
import 'package:base/features/presentation/pages/article_home_listing_page.dart';
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


  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    ArticleHomeListingPage(),
    ArticleFavouritePage(),
    ArticleCategoryPage(),
    ArticleAboutPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadOffline();
  }
  void _loadOffline()async{
    print("ArticleHomePage->_loadOffline");
    await Provider.of<ArticleProvider>(context, listen: false).loadOfflineArticles();
    await Provider.of<ArticleProvider>(context, listen: false).loadOfflineCategories();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(appName),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        items:<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.surface,
            icon: _selectedIndex == 0 ? Icon(Icons.home) : Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.surface,
            icon: _selectedIndex == 1 ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.surface,
            icon: _selectedIndex == 2 ? Icon(Icons.category) : Icon(Icons.category_outlined),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.surface,
            icon: _selectedIndex == 3 ? Icon(Icons.person) : Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
  /*
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _refresh();
    _loadOffline();
  }

  void _loadOffline()async{
    setState(() {
      loading = true;
    });
    await Provider.of<ArticleProvider>(context, listen: false).loadOfflineArticles();
    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        loading = false;
      });
    });
  }
  void _refresh() async{
    setState(() {
      loading = true;
    });
    await Provider.of<ArticleProvider>(context, listen: false).loadOfflineArticles();
    await Provider.of<ArticleProvider>(context, listen: false).loadOnlineArticles();
    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        loading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: Text(appName),
      ),
      */

      body: _articleList(Provider.of<ArticleProvider>(context, listen: true).articles),
      floatingActionButton: _fab(),
    );
  }

  Widget _fab(){
    return FloatingActionButton.extended(
        onPressed: (){
          _refresh();
        },
        icon: Icon(Icons.refresh),
        label: Text("Refresh")
    );
  }



  Widget _articleList(List<Article> articles){
    if(articles.isEmpty && loading == true) return CircularProgressIndicator();
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
        Text("No Articles Available"),
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
              child: Text(article.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }

   */
}
