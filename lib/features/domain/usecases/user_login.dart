import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';


class UserLogin implements UseCase<User, UserLoginParams>{
  final UserRepository userRepository;

  UserLogin({
    required this.userRepository
  });

  @override
  Future<Either<Failure, User>> call(UserLoginParams params) {
    return userRepository.login( email: params.email, password: params.password);
  }
}

class UserLoginParams extends Equatable{
  final String email;
  final String password;

  const UserLoginParams({
    required this.email,
    required this.password
  });
  @override
  List<Object> get props => [email, password];
}
