import 'dart:convert';

import 'package:base/features/data/models/spt_meta_data_model.dart';
import 'package:base/features/domain/entities/latest_news.dart';
import 'package:base/features/domain/entities/spt/spt_meta_data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../const/data.dart';
import '../models/latest_news_model.dart';

abstract class MetaDataRemoteDataSource {
  Future<List<SptMetaData>> getMetaDataList({required String accessToken, required String taxonomy, required int pageNo});
}


class MetaDataRemoteDataSourceImpl implements MetaDataRemoteDataSource {
  //final http.Client client;
  final Dio client;


  MetaDataRemoteDataSourceImpl({required this.client});

  @override
  Future<List<SptMetaData>> getMetaDataList({required String accessToken, required String taxonomy, required int pageNo}) async{
    try{
      String endPoint =  metaDataList[taxonomy]?.name ?? "thereIsNoMetaDataEndpointFor->$taxonomy";
      endPoint += "/?page=$pageNo";
      print("MetaDataRemoteDataSourceImpl->getMetaDataList for page $pageNo");
      print("endpoint is $endPoint");

      final response = await client.get(endPoint);
      List<SptMetaData> metaList = [];
      print(response);
      print("MetaDataRemoteDataSourceImpl->getMetaDataList response");
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      //var dataResponse = response.data;
      List<dynamic> dataList =  response.data;  // list of meta data json
      print("data is ");
      print(dataList);

      for(int i=0; i<dataList.length; i++){
        try{
          metaList.add(SptMetaDataModel.fromJson(dataList[i]).toEntity());
        }catch(innerExp, stackTrace){
          print('MetaDataRemoteDataSourceImpl->getMetaDataList innerExp $innerExp');
          print(stackTrace);
        }
      }
      print("MetaDataRemoteDataSourceImpl->getMetaDataList return SptMetaDataList for taxonomy $taxonomy");
      print(metaList);
      return metaList;
    }
    catch(exp){
        rethrow;
    }
  }
}