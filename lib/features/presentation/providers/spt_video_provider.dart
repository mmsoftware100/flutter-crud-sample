

import 'dart:core';

import 'package:base/core/error/failures.dart';
import 'package:base/features/data/const/data.dart';
import 'package:base/features/domain/entities/latest_news.dart';
import 'package:base/features/domain/entities/spt/spt_meta_data.dart';
import 'package:base/features/domain/entities/spt/video.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/usecases/get_latest_news.dart';
import 'package:base/features/domain/usecases/get_video_list.dart';
import 'package:base/features/domain/usecases/user_register.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/category.dart';
import '../../domain/usecases/user_login.dart';
class SptVideoProvider extends ChangeNotifier {
  final GetVideoList getVideoList;

  SptVideoProvider({
    required this.getVideoList
  });

  // what we store here?
  /**
   * slide show
   * genres -> technical color
   * years
   * latest movie list
   * latest tv show list
   * selected movie listing with page no
   * selected tv show listing with page no
   * selected movie detail
   * selected tv show detail
   */

  // for home page
  //List<SptMetaData> genresDataList = genresList;
  //List<SptMetaData> yearsDataList = yearsList;
  List<Video> latestMoviesDataList = []; //latestMoviesList;
  List<Video> latestTvShowsDataList = []; //latestTvShowsList;

  // for detail page
  Video selectedVideoData = Video.sample();

  // for listing page
  // ဒါက pagination အတွက်။
  List<Video> videoListWithPagination = [];

  // helper data
  int page = 0;
  String metaDataId = "0";
  String searchKeyword = "";
  String videoType = "movies";

  bool paginationStatus = false;

  // tv show နဲ့ movie အတွက်က parameter တစ်ခုပဲ သုံးပြီး ခွဲနိုင်လိမ့်မယ်။
  // api endpoint နှစ်ခု ဖြစ်နေလို့ ။ တစ်ခုတည်းနဲ့ဆိုလည်း query ဘက်မှာ တိုင်ပတ်မှာ စိုးလို့။
  // အခုလို ရှင်းရှင်း ထားတာလည်း ကောင်းပါတယ်။


  void setHelperData({
    int newPage = 1,
    String newMetaDataId = "0",
    String newSearchKeyword = "",
    String newVideoType = "movie"
  }){
    page = newPage;
    metaDataId = newMetaDataId;
    searchKeyword = newSearchKeyword;
    videoType = newVideoType;
    videoListWithPagination = [];
  }

  Future<bool> getMovieSampleData()async{
    final Either<Failure, List<Video>> videoListEither = await getVideoList(
        GetVideoListParams(accessToken: "accessToken", videoType: "movie", metaDataId: "0", searchKeyword: "", pageNo: 0)
    );
    bool status = true;
    videoListEither.fold(
            (failure)  {
          // specify failure
          print("SptVideoProvider->getMovieSampleData->failure");
          print(failure);
          notifyListeners();
          status =  false;
        },
            (videoListData)  {
          print("SptVideoProvider->getMovieSampleData->videoListData");
          print(videoListData);
          latestMoviesDataList = videoListData;
          page++;
          notifyListeners();
          status =  true;
        }
    );
    return status;
    /*
    latestMoviesDataList = await getSampleVideoListFromFixture("movies_list.json");
    videoListWithPagination.addAll(latestMoviesDataList);
    notifyListeners();
    return true;

     */
  }

  Future<bool> getTvShowSampleData()async{
    final Either<Failure, List<Video>> videoListEither = await getVideoList(
        GetVideoListParams(accessToken: "accessToken", videoType: "tv_show", metaDataId: "0", searchKeyword: "", pageNo: 0)
    );
    bool status = true;
    videoListEither.fold(
            (failure)  {
          // specify failure
          print("SptVideoProvider->getTvShowSampleData->failure");
          print(failure);
          notifyListeners();
          status =  false;
        },
            (videoListData)  {
          print("SptVideoProvider->getTvShowSampleData->videoListData");
          print(videoListData);
          latestTvShowsDataList = videoListData;
          notifyListeners();
          status =  true;
        }
    );
    return status;
    /*
    latestMoviesDataList = await getSampleVideoListFromFixture("movies_list.json");
    videoListWithPagination.addAll(latestMoviesDataList);
    notifyListeners();
    return true;

     */
  }


  Future<bool> getVideoListForPagination()async{
    paginationStatus = true;
    final Either<Failure, List<Video>> videoListEither = await getVideoList(
        GetVideoListParams(accessToken: "accessToken", videoType: videoType, metaDataId: metaDataId, searchKeyword: searchKeyword, pageNo: page)
    );
    bool status = true;
    paginationStatus = false;
    videoListEither.fold(
            (failure)  {
          // specify failure
          print("SptVideoProvider->getVideoListForPagination->failure");
          print(failure);
          notifyListeners();
          status =  false;
        },
            (videoListData)  {
          print("SptVideoProvider->getTvShowSampleData->videoListData");
          print(videoListData);
          videoListWithPagination.addAll(videoListData); // = videoListData;
          page++;
          notifyListeners();
          status =  true;
        }
    );
    return status;
    /*
    latestMoviesDataList = await getSampleVideoListFromFixture("movies_list.json");
    videoListWithPagination.addAll(latestMoviesDataList);
    notifyListeners();
    return true;

     */
  }

  /* method တွေကတော့ အရှ */
}
