import 'dart:convert';

import 'package:base/features/domain/entities/latest_news.dart';
import 'package:dio/dio.dart';

import '../const/data.dart';
import '../models/latest_news_model.dart';

abstract class LatestNewsRemoteDataSource {
  Future<List<LatestNews>> getLatestNews({required String accessToken, required int categoryId, required int pageNo});
}


class LatestNewsRemoteDataSourceImpl implements LatestNewsRemoteDataSource {
  //final http.Client client;
  final Dio client;


  LatestNewsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<LatestNews>> getLatestNews({required String accessToken, required int categoryId, required int pageNo}) async{
    try{
      String endPoint =  categories[categoryId]?.photo ?? latestNewsEndpoint;
      endPoint += "/?page=$pageNo";
      print("LatestNewsRemoteDataSourceImpl->getLatestNews for page $pageNo");
      print("endpoint is $endPoint");

      final response = await client.get(endPoint);
      List<LatestNews> latestNewsList = [];
      print(response);
      print("LatestNewsRemoteDataSourceImpl->getLatestNews response");
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      List<dynamic> dataResponse = response.data;
      dynamic dataList =  dataResponse;  // list of wp-content
      print("data is ");
      print(dataList);

      for(int i=0; i<dataList.length; i++){
        print('dataList[i]');
        print(jsonEncode(dataList[i]));
        try{
          LatestNewsModel latestNewsModel = LatestNewsModel.fromJson(dataList[i]);
          latestNewsList.add(latestNewsModel.toEntity());
        }catch(innerExp, stackTrace){
          print('LatestNewsRemoteDataSourceImpl->getLatestNews  innerExp $innerExp');
          print(stackTrace);
        }
      }
      print("LatestNewsRemoteDataSourceImpl->getLatestNews return latestNewsList for categoryId $categoryId");
      print(latestNewsList);
      return latestNewsList;

    }
    catch(exp, stackTrace){
      print("LatestNewsRemoteDataSourceImpl->getLatestNews throw exception");
      print(exp);
      print(stackTrace);
      rethrow;
    }
  }
}