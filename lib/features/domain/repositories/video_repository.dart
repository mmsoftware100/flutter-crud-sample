import 'package:base/core/error/failures.dart';
import 'package:base/features/domain/entities/spt/video.dart';
import 'package:dartz/dartz.dart';


abstract class VideoRepository {
  // register
  Future<Either<Failure, List<Video>>> getVideoList({
    required String accessToken,
    required String videoType, // movie | tv_show
    required String metaDataId, // for generes / years / latest update etc
    required String searchKeyword, // for search query
    required int pageNo,
  });
}
