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

class AddToCart implements UseCase<Ticket, AddToCartParams>{
  final TicketRepository ticketRepository;

  AddToCart({
    required this.ticketRepository
  });
  @override
  Future<Either<Failure, Ticket>> call(AddToCartParams params){
    return ticketRepository.addToCart(accessToken: params.accessToken,ticketId: params.ticketId, cart: params.cart);
  }
}
class AddToCartParams extends Equatable{
  final String accessToken;
  final int ticketId;
  final bool cart;

  const AddToCartParams({
    required this.accessToken,
    required this.ticketId,
    required this.cart
  });
  @override
  List<Object> get props => [accessToken,ticketId, cart];
}
