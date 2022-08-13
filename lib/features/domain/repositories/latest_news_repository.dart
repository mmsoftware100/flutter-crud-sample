import 'package:base/core/error/failures.dart';
import 'package:base/features/domain/entities/latest_news.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:dartz/dartz.dart';


abstract class LatestNewsRepository {
  // register
  Future<Either<Failure, List<LatestNews>>> getLatestNews({
    required String accessToken,
    required int categoryId,
    required int pageNo
  });
}
