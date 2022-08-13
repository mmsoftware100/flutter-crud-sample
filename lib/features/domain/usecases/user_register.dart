import 'package:base/core/usercase/usecase.dart';
import 'package:base/features/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/user.dart';


class UserRegister implements UseCase<User, UserRegisterParams>{
  final UserRepository userRepository;

  UserRegister({
    required this.userRepository
  });

  @override
  Future<Either<Failure, User>> call(UserRegisterParams params) {
    return userRepository.register(name: params.name, email: params.email, password: params.password, phoneNo: params.phoneNo);
  }
}

class UserRegisterParams extends Equatable{
  final String name;
  final String email;
  final String phoneNo;
  final String password;

  const UserRegisterParams({
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.password
  });
  @override
  List<Object> get props => [name, email, phoneNo, password];
}
