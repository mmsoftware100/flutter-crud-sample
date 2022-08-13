

import 'dart:core';

import 'package:base/core/error/failures.dart';
import 'package:base/features/data/const/data.dart';
import 'package:base/features/domain/entities/latest_news.dart';
import 'package:base/features/domain/entities/spt/spt_meta_data.dart';
import 'package:base/features/domain/entities/spt/video.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/usecases/get_latest_news.dart';
import 'package:base/features/domain/usecases/get_meta_data_list.dart';
import 'package:base/features/domain/usecases/user_register.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/category.dart';
import '../../domain/usecases/user_login.dart';
class SptMetaDataProvider extends ChangeNotifier {
  final GetMetaDataList getMetaDataList;
  // for home page
  List<SptMetaData> genresDataList = []; // = genresList;
  List<SptMetaData> yearsDataList = [] ; // = yearsList;

  // for detail page
  SptMetaData selectedSptMetaData = SptMetaData.sample();

  // helper data
  int genresPage = 0;
  int yearsPage = 0;


  SptMetaDataProvider({
    required this.getMetaDataList
  });



  void setHelperData({
    int newPage = 0
  }){
    genresPage = newPage;
  }

  void setSptMetaData(SptMetaData newSptMetaData){
    selectedSptMetaData = newSptMetaData;
    notifyListeners();
  }

  Future<bool> getSptMetaDataForGenres({required String accessToken})async{
    final Either<Failure, List<SptMetaData>> latestNewsListEither = await getMetaDataList(
        GetMetaDataListParams(taxonomy: genreMetaData.taxonomy, accessToken: accessToken, pageNo: genresPage)
    );
    bool status = true;
    latestNewsListEither.fold(
            (failure)  {
          // specify failure
          print("SptMetaDataProvider->getSptMetaDataForGenres->failure");
          print(failure);
          notifyListeners();
          status =  false;
        },
            (sptMetaDataList)  {
          print("SptMetaDataProvider->getSptMetaDataForGenres->sptMetaDataList");
          print(sptMetaDataList);
          genresDataList = sptMetaDataList;
          notifyListeners();
          status =  true;
        }
    );
    return status;
  }



  Future<bool> getSptMetaDataForYears({required String accessToken})async{
    final Either<Failure, List<SptMetaData>> latestNewsListEither = await getMetaDataList(
        GetMetaDataListParams(taxonomy: yearMetaData.taxonomy, accessToken: accessToken, pageNo: yearsPage)
    );
    bool status = true;
    latestNewsListEither.fold(
            (failure)  {
          // specify failure
          print("SptMetaDataProvider->getSptMetaDataForYears->failure");
          print(failure);
          notifyListeners();
          status =  false;
        },
            (sptMetaDataList)  {
          print("SptMetaDataProvider->getSptMetaDataForYears->sptMetaDataList");
          print(sptMetaDataList);
          yearsDataList = sptMetaDataList;
          notifyListeners();
          status =  true;
        }
    );
    return status;
  }
/* method တွေကတော့ အရှ */
}
