import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/entities/spt/spt_meta_data.dart';
import 'package:base/features/domain/repositories/latest_news_repository.dart';
import 'package:base/features/domain/repositories/meta_data_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/latest_news.dart';
import '../entities/user.dart';

class GetMetaDataList implements UseCase<List<SptMetaData>,GetMetaDataListParams>{
  final MetaDataRepository metaDataRepository;

  GetMetaDataList({ required this.metaDataRepository});
  @override
  Future<Either<Failure, List<SptMetaData>>> call(GetMetaDataListParams params) {
    return metaDataRepository.getMetaDataList(accessToken: params.accessToken, taxonomy: params.taxonomy, pageNo: params.pageNo);
  }
}

class GetMetaDataListParams extends Equatable{
  final String accessToken;
  final String taxonomy; // genres , years, dtcast, dtdirectors
  final int pageNo;

  const GetMetaDataListParams({
    required this.accessToken,
    required this.taxonomy,
    required this.pageNo
  });
  @override
  List<Object> get props => [accessToken,taxonomy, pageNo];
}


