import 'dart:convert';

import 'package:base/features/data/models/spt_meta_data_model.dart';
import 'package:base/features/domain/entities/latest_news.dart';
import 'package:base/features/domain/entities/spt/spt_meta_data.dart';
import 'package:base/features/domain/entities/spt/video.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../const/data.dart';
import '../models/latest_news_model.dart';
import '../models/video_model.dart';

abstract class VideoRemoteDataSource {
  Future<List<Video>> getVideoList({
    required String accessToken,
    required String videoType, // movie | tv_show
    required String metaDataId, // for generes / years / latest update etc
    required String searchKeyword, // for search query
    required int pageNo,
  });
}


class VideoRemoteDataSourceImpl implements VideoRemoteDataSource {
  //final http.Client client;
  final Dio client;


  VideoRemoteDataSourceImpl({required this.client});


  @override
  Future<List<Video>> getVideoList({required String accessToken, required String videoType, required String metaDataId, required String searchKeyword, required int pageNo}) async{
    try{
      String endPoint =  videoType == "movie" ? sptMoviesEndpoint : sptTvShowsEndpoint;
      endPoint += "/?page=$pageNo&meta=$metaDataId&q=$searchKeyword";
      print("VideoRemoteDataSourceImpl->getVideoList for page $pageNo");
      print("endpoint is $endPoint");

      final response = await client.get(endPoint);
      List<Video> videoList = [];
      print(response);
      print("VideoRemoteDataSourceImpl->getVideoList response");
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      List<dynamic> dataList =  response.data;  // list of meta data json


      for(int i=0; i<dataList.length; i++){
        try{
          videoList.add(VideoModel.fromJson(dataList[i]).toEntity());
        }catch(innerExp, stackTrace){
          print('VideoRemoteDataSourceImpl->getVideoList innerExp $innerExp');
          print(stackTrace);
        }
      }
      print("VideoRemoteDataSourceImpl->getVideoListreturn VideoList ");
      print(videoList);
      if(searchKeyword.isNotEmpty){
        endPoint =  sptTvShowsEndpoint;
        endPoint += "/?page=$pageNo&meta=$metaDataId&q=$searchKeyword";
        print("VideoRemoteDataSourceImpl->getVideoList for series $pageNo");
        print("endpoint is $endPoint");

        final response = await client.get(endPoint);

        List<dynamic> dataList =  response.data;
        for(int i=0; i<dataList.length; i++){
          try{
            videoList.add(VideoModel.fromJson(dataList[i]).toEntity());
          }catch(innerExp, stackTrace){
            print('VideoRemoteDataSourceImpl->getVideoList innerExp for series $innerExp');
            print(stackTrace);
          }
        }
      }
      return videoList;
    }
    catch(exp, stackTrace){
      print("VideoRemoteDataSource->getVideoList exp");
      print(exp);
      print(stackTrace);
      rethrow;
    }
  }
}