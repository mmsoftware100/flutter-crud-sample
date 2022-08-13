

import 'package:base/core/error/failures.dart';
import 'package:base/features/data/datasources/latest_news_remote_data_source.dart';
import 'package:base/features/data/datasources/ticket_remote_data_source.dart';
import 'package:base/features/domain/entities/dreamcatcher/ticket.dart';
import 'package:base/features/domain/entities/latest_news.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/repositories/latest_news_repository.dart';
import 'package:base/features/domain/repositories/ticket_repository.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository{
  final UserRemoteDataSource userRemoteDataSource;
  UserRepositoryImpl({
    required this.userRemoteDataSource
  });

  /*
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

   */

  @override
  Future<Either<Failure, User>> forgetPassword({required String email}) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> getProfile({required String accessToken}) {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> login({required String email, required String password}) async{
    try{
      User user =  await userRemoteDataSource.login(email: email, password: password);
      return Right(user);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> register({required String name, required String email, required String password, required String phoneNo}) async{
    try{
      User user =  await userRemoteDataSource.register(name: name, email: email, password: password, phoneNo: phoneNo);
      return Right(user);
    }
    catch(exp){
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, User>> resetPassword({required String accessToken, required String password}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> updatePassword({required String accessToken, required String oldPassword, required String newPassword}) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> updateProfile({required String accessToken, required String name, required String phoneNo}) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> verifyPassword({required String email, required String otp}) {
    // TODO: implement verifyPassword
    throw UnimplementedError();
  }

}
