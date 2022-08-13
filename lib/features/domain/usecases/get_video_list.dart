import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/repositories/video_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../entities/spt/video.dart';

class GetVideoList implements UseCase<List<Video>, GetVideoListParams>{
  final VideoRepository videoRepository;

  GetVideoList({ required this.videoRepository});
  @override
  Future<Either<Failure, List<Video>>> call(GetVideoListParams params) {
    return videoRepository.getVideoList(accessToken: params.accessToken, videoType: params.videoType, metaDataId: params.metaDataId, searchKeyword: params.searchKeyword, pageNo: params.pageNo);
  }

}
/* ဒီအတိုင်းဆို api တောင် တစ်ကြောင်းတည်းနဲ့ ကိစ္စ ပြတ်တယ် */
/* video အတွက် တစ်ကြောင်း ၊ meta data အတွက် တစ်ကြောင်း */
/* လောလောဆယ်တော့ ကိစ္စ ပြီးအောင် တစ်ခုချင်းစီ ခွဲရေးထားတာပေါ့ */
class GetVideoListParams extends Equatable{
  final String accessToken;
  final String videoType; // movie | tv_show
  final String metaDataId; // for generes / years / latest update etc
  final String searchKeyword; // for search query
  final int pageNo;

  const GetVideoListParams({
    required this.accessToken,
    required this.videoType,
    required this.metaDataId,
    required this.searchKeyword,
    required this.pageNo
  });
  @override
  List<Object> get props => [accessToken,videoType, metaDataId, searchKeyword, pageNo];
}




