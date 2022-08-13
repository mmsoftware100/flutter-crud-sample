

import 'package:base/core/error/failures.dart';
import 'package:base/features/data/datasources/latest_news_remote_data_source.dart';
import 'package:base/features/domain/entities/latest_news.dart';
import 'package:base/features/domain/repositories/latest_news_repository.dart';
import 'package:dartz/dartz.dart';

class LatestNewsRepositoryImpl implements LatestNewsRepository{
  final LatestNewsRemoteDataSource latestNewsRemoteDataSource;
  LatestNewsRepositoryImpl({
    required this.latestNewsRemoteDataSource
  });

  @override
  Future<Either<Failure, List<LatestNews>>> getLatestNews({required String accessToken, required int categoryId, required int pageNo}) async{
    try{
      List<LatestNews> latestNewsList =  await latestNewsRemoteDataSource.getLatestNews(accessToken: accessToken,categoryId: categoryId, pageNo: pageNo);
      return Right(latestNewsList);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }

}
