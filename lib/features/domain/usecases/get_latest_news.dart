import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/repositories/latest_news_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/latest_news.dart';
import '../entities/user.dart';

class GetLatestNews implements UseCase<List<LatestNews>, GetLatestNewsParams>{
  final LatestNewsRepository latestNewsRepository;

  GetLatestNews({
    required this.latestNewsRepository
  });
  @override
  Future<Either<Failure, List<LatestNews>>> call(GetLatestNewsParams params){
    return latestNewsRepository.getLatestNews(accessToken: params.accessToken,categoryId: params.categoryId, pageNo: params.pageNo);
  }
}
class GetLatestNewsParams extends Equatable{
  final String accessToken;
  final int categoryId;
  final int pageNo;

  const GetLatestNewsParams({
    required this.accessToken,
    required this.categoryId,
    required this.pageNo
  });
  @override
  List<Object> get props => [accessToken,categoryId, pageNo];
}
