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

class MakeOrder implements UseCase<List<Ticket>, MakeOrderParams>{
  final TicketRepository ticketRepository;

  MakeOrder({
    required this.ticketRepository
  });
  @override
  Future<Either<Failure, List<Ticket>>> call(MakeOrderParams params){
    return ticketRepository.makeOrder(accessToken: params.accessToken);
  }
}
class MakeOrderParams extends Equatable{
  final String accessToken;

  const MakeOrderParams({
    required this.accessToken
  });
  @override
  List<Object> get props => [accessToken];
}
