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

class AddToFavourite implements UseCase<Ticket, AddToFavouriteParams>{
  final TicketRepository ticketRepository;

  AddToFavourite({
    required this.ticketRepository
  });
  @override
  Future<Either<Failure, Ticket>> call(AddToFavouriteParams params){
    return ticketRepository.addToFavourite(accessToken: params.accessToken,ticketId: params.ticketId, favourite: params.favourite);
  }
}
class AddToFavouriteParams extends Equatable{
  final String accessToken;
  final int ticketId;
  final bool favourite;

  const AddToFavouriteParams({
    required this.accessToken,
    required this.ticketId,
    required this.favourite
  });
  @override
  List<Object> get props => [accessToken,ticketId, favourite];
}
