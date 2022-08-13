

import 'package:base/core/error/failures.dart';
import 'package:base/features/data/datasources/latest_news_remote_data_source.dart';
import 'package:base/features/data/datasources/ticket_remote_data_source.dart';
import 'package:base/features/domain/entities/dreamcatcher/ticket.dart';
import 'package:base/features/domain/entities/latest_news.dart';
import 'package:base/features/domain/repositories/latest_news_repository.dart';
import 'package:base/features/domain/repositories/ticket_repository.dart';
import 'package:dartz/dartz.dart';

class TicketRepositoryImpl implements TicketRepository{
  final TicketRemoteDataSource ticketRemoteDataSource;
  TicketRepositoryImpl({
    required this.ticketRemoteDataSource
  });

  @override
  Future<Either<Failure, List<Ticket>>> getTicketList({required String accessToken, required int categoryId, required int pageNo}) async{
    try{
      List<Ticket> ticketList =  await ticketRemoteDataSource.getTicketList(accessToken: accessToken,categoryId: categoryId, pageNo: pageNo);
      return Right(ticketList);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Ticket>> addToCart({required String accessToken, required int ticketId, required bool cart}) async{
    try{
      Ticket ticket =  await ticketRemoteDataSource.addToCart(accessToken: accessToken,ticketId: ticketId, cart: cart);
      return Right(ticket);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Ticket>> addToFavourite({required String accessToken, required int ticketId, required bool favourite}) async{
    try{
      Ticket ticket =  await ticketRemoteDataSource.addToFavourite(accessToken: accessToken,ticketId: ticketId, favourite: favourite);
      return Right(ticket);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Ticket>>> makeOrder({required String accessToken}) async{
    try{
      List<Ticket> tickets =  await ticketRemoteDataSource.makeOrder(accessToken: accessToken);
      return Right(tickets);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }

}
