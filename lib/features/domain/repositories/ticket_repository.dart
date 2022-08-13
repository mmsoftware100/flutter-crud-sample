import 'package:base/core/error/failures.dart';
import 'package:base/features/domain/entities/dreamcatcher/ticket.dart';
import 'package:base/features/domain/entities/latest_news.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:dartz/dartz.dart';


abstract class TicketRepository {
  // register
  Future<Either<Failure, List<Ticket>>> getTicketList({
    required String accessToken,
    required int categoryId,
    required int pageNo
  });
  // add / remove from cart
  Future<Either<Failure, Ticket>> addToCart({
    required String accessToken,
    required int ticketId,
    required bool cart
  });
  // add / remove favourite
  Future<Either<Failure, Ticket>> addToFavourite({
    required String accessToken,
    required int ticketId,
    required bool favourite
  });
  // make order
  Future<Either<Failure, List<Ticket>>> makeOrder({
    required String accessToken
  });
}