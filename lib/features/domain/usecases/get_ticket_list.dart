import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/entities/dreamcatcher/ticket.dart';
import 'package:base/features/domain/repositories/latest_news_repository.dart';
import 'package:base/features/domain/repositories/ticket_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/latest_news.dart';
import '../entities/user.dart';

class GetTicketList implements UseCase<List<Ticket>, GetTicketListParams>{
  final TicketRepository ticketRepository;

  GetTicketList({
    required this.ticketRepository
  });
  @override
  Future<Either<Failure, List<Ticket>>> call(GetTicketListParams params){
    return ticketRepository.getTicketList(accessToken: params.accessToken,categoryId: params.categoryId, pageNo: params.pageNo);
  }
}
class GetTicketListParams extends Equatable{
  final String accessToken;
  final int categoryId;
  final int pageNo;

  const GetTicketListParams({
    required this.accessToken,
    required this.categoryId,
    required this.pageNo
  });
  @override
  List<Object> get props => [accessToken,categoryId, pageNo];
}
