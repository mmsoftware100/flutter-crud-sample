import 'package:base/core/error/failures.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:dartz/dartz.dart';


abstract class UserRepository {
  // register
  Future<Either<Failure, User>> register({required String name, required String email, required String password, required String phoneNo });
  // login
  Future<Either<Failure, User>> login({required String email, required String password});
  // resume
  Future<Either<Failure, User>> getProfile({required String accessToken});
  // change password
  Future<Either<Failure, User>> updatePassword({required String accessToken, required String oldPassword, required String newPassword});
  // update profile
  Future<Either<Failure, User>> updateProfile({required String accessToken, required String name, required String phoneNo});
  // forget password
  Future<Either<Failure, User>> forgetPassword({required String email});
  // verify password
  Future<Either<Failure, User>> verifyPassword({required String email, required String otp});
  // reset password
  Future<Either<Failure, User>> resetPassword({required String accessToken, required String password});
}
