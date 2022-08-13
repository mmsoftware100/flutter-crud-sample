import 'package:base/core/error/failures.dart';
import 'package:base/features/domain/entities/latest_news.dart';
import 'package:base/features/domain/entities/spt/spt_meta_data.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';


abstract class MetaDataRepository {
  // register
  Future<Either<Failure, List<SptMetaData>>> getMetaDataList({
    required String accessToken,
    required String taxonomy, // genres , years, dtcast, dtdirectors
    required int pageNo
  });
}
