

import 'dart:convert';
import 'dart:core';

import 'package:base/features/data/const/data.dart';
import 'package:base/features/data/models/article_model.dart';
import 'package:base/features/data/models/category_model.dart';
import 'package:base/features/domain/entities/article.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/category.dart';
class ArticleProvider extends ChangeNotifier {
  final SharedPreferences sharedPreferences;
  final Dio client;

  ArticleProvider({
    required this.sharedPreferences,
    required this.client
  });

  int noOfArticles = 0;
  List<Article> articles = [];
  List<Category> categories = [];
  Article article = Article.sample;
  Category category = Category.sample;


  List<Article> getFavouriteArticles(){
    List<Article> favouriteArticles = [];
    articles.forEach((element) {
      if(element.favourite){
        favouriteArticles.add(element);
      }
    });
    return favouriteArticles;
  }
  void setArticle(Article articleUpdate){
    article = articleUpdate;
    notifyListeners();
  }

  void setCategory(Category categoryUpdate){
    category = categoryUpdate;
    notifyListeners();
  }

  List<Article> getArticlesByCategory(Category category){
    List<Article> articlesByCategory = [];
    for(int i=0;  i < articles.length; i++ ){
      if(articles[i].categoryId == category.id){
        articlesByCategory.add(articles[i]);
      }
    }
    return articlesByCategory;
  }

  Future<bool> toggleFavourite(Article articleUpdate) async{
    // find and update in local storage
    bool status = true;
    print("ArticleProvider->toggleFavourite START id ${articleUpdate.id} ${articleUpdate.favourite}");
    print("updating at data repo"); //")
    for(int i=0; i< articles.length; i++){
      if(articles[i].id == articleUpdate.id){
        print("FOUND");
        // add = false;
        // need to update
        articles[i].favourite = !articles[i].favourite;
        // articleUpdate.favourite = articles[i].favourite; // we just need to keep favourite local data
        //dataResponse['favourite'] = articles[i].favourite;
        try{

          print("updating shared preference");
          String str = sharedPreferences.getString(articleUpdate.id.toString()) ?? "";
          Map<String, dynamic> json = jsonDecode(str);
          json['favourite'] = articles[i].favourite;
          print(json['title']);
          print(json['favourite']);
          await sharedPreferences.setString(articleUpdate.id.toString(), jsonEncode(json));
        }
        catch(exp,stackTrace){
          print("ArticleProvider->toggleFavourite");
          print(exp);
          print(stackTrace);
        }

        //sharedPreferences.setString(dataResponse["id"].toString(), jsonEncode(dataResponse));
        // articles[i] = articleUpdate;
        // stop here
        //return;
      }
    }

    notifyListeners();
    return status;
  }

  Future<bool> loadOfflineArticles()async{
    // get number of itmes
    print("ArticleProvider->loadOfflineArticles");
    //int noOfArticleLocal = 0;
    articles.clear();
    //noOfArticleLocal = sharedPreferences.getInt(NUMBER_OF_ARTICLE) ?? 0;
    //print(noOfArticleLocal);
    sharedPreferences.getKeys().forEach((element) {
      try{
        String jsonString = sharedPreferences.getString(element.toString()) ?? "";
        Map<String, dynamic> json = jsonDecode(jsonString);
        Article newArticle = ArticleModel.fromJson(json).toEntity();
        article.photo = PHOTO_ENDPOINT+"/1.png"; // TODO: remove
        print("ArticleProvider->loadOfflineArticles $element");
        print(newArticle);
        articles.add(newArticle);
      }
      catch(exp,stackTrace){
        print("ArticleProvider->loadOfflineArticles inner exp");
        print(exp);
        print(stackTrace);
      }
    });
    /*
    for(int i=1; i <= noOfArticleLocal; i++){
      try{
        String jsonString = sharedPreferences.getString(i.toString()) ?? "";
        Map<String, dynamic> json = jsonDecode(jsonString);
        Article newArticle = ArticleModel.fromJson(json).toEntity();
        print("ArticleProvider->loadOfflineArticles $i");
        print(newArticle);
        articles.add(newArticle);
      }
      catch(exp,stackTrace){
        print("ArticleProvider->loadOfflineArticles inner exp");
        print(exp);
        print(stackTrace);
      }
    }

     */
    articles.shuffle();
    notifyListeners();
    return true;
  }

  Future<bool> loadOnlineArticles()async{
    // get number of article and last sync time
    //int noOfArticleLocal = 0;
    //noOfArticleLocal = sharedPreferences.getInt(NUMBER_OF_ARTICLE) ?? 0;
    //String lastSyncTimeStringLocal = sharedPreferences.getString(LAST_SYNC_TIME) ?? "1969-07-20 20:18:04Z";
    //DateTime lastSyncTimeLocal = DateTime.tryParse(lastSyncTimeStringLocal) ?? DateTime.now();

    try{
      Config config = await _shouldSync();
      int numberOfPost = sharedPreferences.getInt(NUMBER_OF_ARTICLE) ?? 0;
      String lastUpdateTime = sharedPreferences.getString(LAST_SYNC_TIME) ?? DateTime.now().toString();
      // DateTime lastUpdateTime = DateTime.tryParse(lastUpdateTimeStr) ?? DateTime.now();

      int currentPostNo = 0;
      print("ArticleProvider->loadOnlineArticles numberOfPost $numberOfPost updated at $lastUpdateTime");
      print(config.numberOfPost.toString() + " , " +config.lastUpdatedTime);
      if(config.lastUpdatedTime != lastUpdateTime || config.numberOfPost != numberOfPost){
        for(int i=1; i <= config.numberOfPost; i++){
          bool status = await _getArticleByIdFromRemote(i);
          if(status){
            currentPostNo++;
            print("currentPostNo is $currentPostNo");
          }
        }
        await sharedPreferences.setInt(NUMBER_OF_ARTICLE, currentPostNo);
        await sharedPreferences.setString(LAST_SYNC_TIME, config.lastUpdatedTime.toString());
      }
      else{
        print("already updated");
      }


      notifyListeners();

      return true;

      /*

      final response = await client.get(CONFIG_ENDPOINT);
      print(response);
      print("ArticleProvider->loadOnlineArticles response");
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      Map<String, dynamic> dataResponse = response.data;
      print(dataResponse);

      String lastSyncTimeStringRemote = dataResponse["last_updated_time"] ?? "1969-07-20 20:18:04Z";
      DateTime lastSyncTimeRemote = DateTime.tryParse(lastSyncTimeStringRemote) ?? DateTime.now();
      int noOfArticlesRemote = dataResponse["number_of_post"] ?? 0;

      if(lastSyncTimeRemote.isAfter(lastSyncTimeLocal) || noOfArticleLocal != noOfArticlesRemote){
        // get all data from server
        for(int i=1; i <= noOfArticlesRemote; i++){
          _getArticleByIdFromRemote(i);
        }
      }

       */
    }
    catch(exp, stackTrace){
      print("LatestNewsRemoteDataSourceImpl->getLatestNews throw exception");
      print(exp);
      print(stackTrace);
      return false;
    }
  }

  Future<bool> _getArticleByIdFromRemote(int id)async{
    try{
      String endPoint = ARTICLE_ENDPOINT+"/$id.json";
      print("ArticleProvider->_getArticleByIdFromRemote endpoint is $endPoint");
      final response = await client.get(endPoint);
      print("ArticleProvider->_getArticleByIdFromRemote for id $id response");
      //print(response);
      print('Response status: ${response.statusCode}');
      //print('Response data: ${response.data}');

      Map<String, dynamic> dataResponse = response.data; // article json
      // print(dataResponse);
      // store / update to shared preference
      // update repo
      // dataResponse["id"] = id; // TODO: remove
      // dataResponse["photo"] = PHOTO_ENDPOINT+"/1.png"; // TODO: remove
      _addOrUpdateRepo(ArticleModel.fromJson(dataResponse).toEntity(), dataResponse);
      return true;
    }
    catch(exp, stackTrace){
      print("LatestNewsRemoteDataSourceImpl->getLatestNews throw exception");
      print(exp);
      print(stackTrace);
      rethrow;
    }
  }

  void _addOrUpdateRepo(Article articleUpdate, Map<String,dynamic> dataResponse){
    bool add = true;
    for(int i=0; i< articles.length; i++){
      if(articles[i].id == articleUpdate.id){
        add = false;
        // need to update
        articleUpdate.favourite = articles[i].favourite; // we just need to keep favourite local data
        dataResponse['favourite'] = articles[i].favourite;

        sharedPreferences.setString(dataResponse["id"].toString(), jsonEncode(dataResponse));
        articles[i] = articleUpdate;
        // stop here
        return;
      }
    }
    if(add){
      articles.add(articleUpdate);
      sharedPreferences.setString(dataResponse["id"].toString(), jsonEncode(dataResponse));
    }
  }

  void addOrUpdateCategory(Category category){
    bool insert = true;
    for(int i=0; i < categories.length; i++){
      if(categories[i].id == category.id){
        categories[i] = category;
        insert = false;
      }
    }
    if(insert){
      categories.add(category);
    }
  }

  // get number of post and sync datetime
  Future<Config> _shouldSync()async{
    try{
      print("ArticleProvider->_shouldSync endpoint is $CONFIG_ENDPOINT");
      final response = await client.get(CONFIG_ENDPOINT);
      print("ArticleProvider->_shouldSync response");
      //print(response);
      print('Response status: ${response.statusCode}');
      //print('Response data: ${response.data}');

      Map<String, dynamic> dataResponse = response.data; // article json
      print(dataResponse);
      // store / update to shared preference
      // update repo
      int numberOfPost = dataResponse['number_of_post'] ?? 50; // TODO: remove
      String lastUpdatedTime = dataResponse['last_updated_time'] ?? DateTime.now().toString(); // TODO: remove
      Config config = Config(numberOfPost: numberOfPost, lastUpdatedTime: lastUpdatedTime);
      return config;
    }
    catch(exp, stackTrace){
      print("ArticleProvider->_shouldSync throw exception");
      print(exp);
      print(stackTrace);
      rethrow;
    }
  }

  /*
  String data = await DefaultAssetBundle.of(context).loadString("assets/data.json");
  final jsonResult = jsonDecode(data); //latest Dart
   */

  // load local categories
  Future<bool> loadOfflineCategories()async{
    // load from local

    // load from remote

    // notify listener

    // get number of itmes
    print("ArticleProvider->loadOfflineArticles");
    //int noOfArticleLocal = 0;
    categories.clear();
    //noOfArticleLocal = sharedPreferences.getInt(NUMBER_OF_ARTICLE) ?? 0;
    //print(noOfArticleLocal);
    // TODO: performance issue ရှိနိုင်တယ်။ shared preferences တွေကို တောက်လျှောက် အစအဆုံး ခေါ် ကြည့်နေတာဆိုတော့
    sharedPreferences.getKeys().forEach((element) {
      if(element.contains("cat_")){

        try{
          String jsonString = sharedPreferences.getString(element.toString()) ?? "";
          Map<String, dynamic> json = jsonDecode(jsonString);
          Category newCategory = CategoryModel.fromJson(json).toEntity();
          print("ArticleProvider->getCategories $element");
          print(newCategory);
          categories.add(newCategory);
        }
        catch(exp,stackTrace){
          print("ArticleProvider->getCategories inner exp");
          print(exp);
          print(stackTrace);
        }
      }
    });
    notifyListeners();
    return true;
  }

  Future<bool> loadRemoteCategories()async{
    try{
      print("ArticleProvider->loadRemoteCategories endpoint is $CATEGORY_ENDPOINT");
      final response = await client.get(CATEGORY_ENDPOINT);
      print("ArticleProvider->loadRemoteCategories response");
      //print(response);
      print('Response status: ${response.statusCode}');
      //print('Response data: ${response.data}');

      List<dynamic> dataList = response.data; // article json
      print(dataList);
      for(int i=0; i < dataList.length; i++){
        // store to shared preference
        try{
          Category category = CategoryModel.fromJson(dataList[i]).toEntity();
          addOrUpdateCategory(category);
          await sharedPreferences.setString("cat_"+dataList[i]["id"].toString(), jsonEncode(dataList[i]));
        }
        catch(exp,stackTrace){
          print("ArticleProvider->getRemoteCategory inner exp");
          print(exp);
          print(stackTrace);
        }
      }
    }
    catch(exp, stackTrace){
      print("ArticleProvider->_shouldSync throw exception");
      print(exp);
      print(stackTrace);
      rethrow;
    }
    notifyListeners();
    return true;
  }
}

class Config{
  int numberOfPost;
  String lastUpdatedTime;
  Config({required this.numberOfPost, required this.lastUpdatedTime});
}
