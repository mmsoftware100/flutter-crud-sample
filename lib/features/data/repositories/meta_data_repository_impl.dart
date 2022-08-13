

import 'package:base/core/error/failures.dart';
import 'package:base/features/data/datasources/latest_news_remote_data_source.dart';
import 'package:base/features/data/datasources/meta_data_remote_data_source.dart';
import 'package:base/features/domain/entities/latest_news.dart';
import 'package:base/features/domain/entities/spt/spt_meta_data.dart';
import 'package:base/features/domain/repositories/latest_news_repository.dart';
import 'package:base/features/domain/repositories/meta_data_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/src/widgets/basic.dart';

class MetaDataRepositoryImpl implements MetaDataRepository{
  final MetaDataRemoteDataSource metaDataRemoteDataSource;
  MetaDataRepositoryImpl({
    required this.metaDataRemoteDataSource
  });


  @override
  Future<Either<Failure, List<SptMetaData>>> getMetaDataList({required String accessToken, required String taxonomy, required int pageNo}) async{
    try{
      List<SptMetaData> metaList =  await metaDataRemoteDataSource.getMetaDataList(accessToken: accessToken, taxonomy: taxonomy, pageNo: pageNo); // .getLatestNews(accessToken: accessToken,categoryId: categoryId, pageNo: pageNo);
      return Right(metaList);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }

}
