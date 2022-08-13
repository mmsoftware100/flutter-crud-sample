

import 'package:base/core/error/failures.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/usecases/user_register.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../domain/usecases/user_login.dart';
class UserProvider extends ChangeNotifier {
    final UserRegister userRegister;
    final UserLogin userLogin;
    User user = User.sample();

    UserProvider({
        required this.userRegister,
        required this.userLogin
    });

    Future<bool> userRegisterPlz({
        required String name,
        required String email,
        required String phoneNo,
        required String password,
    })async{
        final Either<Failure, User> userEither = await userRegister(UserRegisterParams(
            name: name,
            email: email,
            phoneNo: phoneNo,
            password: password,
        ));
        return userEither.fold(
            (failure)  {
                // specify failure
                print("UserProvider->userRegisterPlz->failure");
                print(failure);
                notifyListeners();
                return false;
            },
            (userData)  {
                print("UserProvider->userRegisterPlz->userData");
                print(userData);
                user = userData;
                notifyListeners();
                return true;
            }
        );
    }



    Future<bool> userLoginPlz({
        required String phoneNo,
        required String password,
    })async{
        final Either<Failure, User> userEither = await userLogin(UserLoginParams(email: phoneNo, password: password));
        return userEither.fold(
                (failure)  {
                // specify failure
                print("UserProvider->userLoginPlz->failure");
                print(failure);
                notifyListeners();
                return false;
            },
                (userData)  {
                print("UserProvider->userLoginPlz->userData");
                print(userData);
                user = userData;
                notifyListeners();
                return true;
            }
        );
    }
}
