

import 'dart:core';

import 'package:base/core/error/failures.dart';
import 'package:base/features/data/const/data.dart';
import 'package:base/features/domain/entities/latest_news.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/usecases/get_latest_news.dart';
import 'package:base/features/domain/usecases/user_register.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/category.dart';
import '../../domain/usecases/user_login.dart';
class LatestNewsProvider extends ChangeNotifier {
  final GetLatestNews getLatestNews;
  int _latestNewsPageNo = 1;
  bool latestNewsListLoading = false;
  List<LatestNews> latestNewsList = [
    LatestNews.sample(),
    LatestNews.sample(),
    LatestNews.sample(),
    LatestNews.sample(),
    LatestNews.sample(),
  ];
  LatestNews latestNews = LatestNews.sample();


  Category currentCategory = latestNewsCategory;





  /* ဒါက ရှိသမျှ news တွေရဲ့ data source ပဲ */
  /* home page က tab တစ်ခုချင်းစီကလည်း ယူသုံးမယ်။ listing page ကလည်း ယူသုံးမယ် */
  /* category တစ်ခုချင်းစီရဲ့ page no ကိုလည်း မှတ်ထားရမယ် */
  /* လက်ထဲမှာ ရှိမယ့် data က page no နဲ့ category id နဲ့ ဖြစ်မယ်။ */
  Map<int, List<LatestNews>> latestNewsRepo = {
    latestNewsCategory.id : [],
    announcementNewsCategory.id : [],
    articleCategory.id : [],
    councilSpeechCategory.id : [],
    nineObjectiveCategory.id : [],
    officeTableCategory.id : [],
    ministerTableCategory.id : [],
    regionMinisterTableCategory.id : [],
    releaseGroupCategory.id : [],
    fiveFutureCategory.id : [],
    lawCategory.id : [],
    websiteCategory.id  : [],
    articleCategory.id : [],
    newsPaperKmCategory.id : [],
    conLawCategory.id : [],
    perspectiveCategory.id : [],
    councilSpeechCategory.id : [],
    villegeNewsCategory.id : [],
    newsPaperKmCategory.id : [],
    newsPaperMalCategory.id : [],
    newsPaperNlmCategory.id : [],
    nameTableCategory.id: [],
    videoCategory.id: []
  };
  Map<int, int> latestNewsPageNoRepo = {
    latestNewsCategory.id : 0,
    announcementNewsCategory.id : 0,
    articleCategory.id : 0,
    councilSpeechCategory.id : 0,
    nineObjectiveCategory.id : 0,
    officeTableCategory.id : 0,
    ministerTableCategory.id : 0,
    regionMinisterTableCategory.id : 0,
    releaseGroupCategory.id : 0,
    fiveFutureCategory.id : 0,
    lawCategory.id : 0,
    websiteCategory.id  : 0,
    articleCategory.id : 0,
    newsPaperKmCategory.id : 0,
    conLawCategory.id : 0,
    perspectiveCategory.id : 0,
    councilSpeechCategory.id : 0,
    villegeNewsCategory.id : 0,
    newsPaperKmCategory.id : 0,
    newsPaperMalCategory.id : 0,
    newsPaperNlmCategory.id : 0,
    nameTableCategory.id: 0,
    videoCategory.id: 0
  };

  void setLatestNews(LatestNews latestNewsUpdate){
    latestNews = latestNewsUpdate;
    notifyListeners();
  }
  void setCurrentCategory(Category latestCategory){
    currentCategory = latestCategory;
    notifyListeners();
  }


  LatestNewsProvider({
    required this.getLatestNews
  });

  Future<String> getLatestNewsPlz({
    required String accessToken,
    required categoryId
  })async{
    print("LatestNewsProvider->getLatestNewsPlz for categoryId $categoryId with accessToken $accessToken");
    //latestNewsListLoading = true;
    //notifyListeners();
    String status = "unknown";
    final Either<Failure, List<LatestNews>> latestNewsListEither = await getLatestNews(
      GetLatestNewsParams(accessToken: accessToken, categoryId: categoryId, pageNo: latestNewsPageNoRepo[categoryId] ?? 1)
    );
    latestNewsListEither.fold(
            (failure)  {
          // specify failure
          print("LatestNewsProvider->getLatestNewsPlz->failure");
          print(failure);
          latestNewsListLoading = false;
          notifyListeners();
          status =  "fail";
        },
            (latestNewsListData)  {
          print("LatestNewsProvider->getLatestNewsPlz->latestNewsListData");
          print(latestNewsListData);
          print("category id $categoryId org data is ");
          print(latestNewsRepo[categoryId]);
          latestNewsRepo[categoryId]?.addAll(latestNewsListData);
          int increasedPageNo  = latestNewsPageNoRepo[categoryId] ??  1;
          increasedPageNo++;
          latestNewsPageNoRepo[categoryId] = increasedPageNo;

          print("increasedPageNo is $increasedPageNo");
          print(latestNewsRepo[categoryId]);
          notifyListeners();
          status =  "success";
        }
    );
    return status;
  }
}
