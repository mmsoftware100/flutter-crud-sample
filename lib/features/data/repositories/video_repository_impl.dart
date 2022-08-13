

import 'package:base/core/error/failures.dart';
import 'package:base/features/data/datasources/latest_news_remote_data_source.dart';
import 'package:base/features/data/datasources/meta_data_remote_data_source.dart';
import 'package:base/features/data/datasources/video_remote_data_source.dart';
import 'package:base/features/domain/entities/latest_news.dart';
import 'package:base/features/domain/entities/spt/spt_meta_data.dart';
import 'package:base/features/domain/entities/spt/video.dart';
import 'package:base/features/domain/repositories/latest_news_repository.dart';
import 'package:base/features/domain/repositories/meta_data_repository.dart';
import 'package:base/features/domain/repositories/video_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/src/widgets/basic.dart';

class VideoRepositoryImpl implements VideoRepository{
  final VideoRemoteDataSource videoRemoteDataSource;
  VideoRepositoryImpl({
    required this.videoRemoteDataSource
  });



  @override
  Future<Either<Failure, List<Video>>> getVideoList({required String accessToken, required String videoType, required String metaDataId, required String searchKeyword, required int pageNo}) async{
    try{
      List<Video> videoList =  await videoRemoteDataSource.getVideoList(accessToken: accessToken, videoType: videoType, metaDataId: metaDataId, searchKeyword: searchKeyword, pageNo: pageNo); // .getLatestNews(accessToken: accessToken,categoryId: categoryId, pageNo: pageNo);
      return Right(videoList);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }

}
