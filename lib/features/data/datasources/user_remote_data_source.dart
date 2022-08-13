import 'dart:convert';

import 'package:base/features/data/models/ticket_model.dart';
import 'package:base/features/data/models/user_model.dart';
import 'package:base/features/domain/entities/latest_news.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/dreamcatcher/ticket.dart';
import '../../domain/entities/user.dart';
import '../const/data.dart';
import '../models/latest_news_model.dart';

abstract class UserRemoteDataSource {
  Future<User> login({required String email, required String password});
  Future<User> register({required String name, required String email, required String password, required String phoneNo});
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource{
  final Dio client;
  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<User> login({required String email, required String password}) async{
    try{
      String endPoint =  loginEndpoint;
      print("UserRemoteDataSource->endPoint $endPoint");
      var data = {
        "email" : email,
        "password" : password
      };
      var response = await client.post(endPoint, data: data);
      print("UserRemoteDataSource->login response");
      print(response);
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      Map<String,dynamic> dataResponse = response.data;
      bool status = dataResponse['status'];
      if(status){
        Map<String, dynamic> userJson = dataResponse['data'];
        try{
          User user = UserModel.fromJson(userJson).toEntity();
          return user;
        }
        catch(exp, stackTrace){
          print("user json serialization exp");
          print(exp);
          print(stackTrace);
          rethrow;
        }
      }
      else{
        throw Exception(dataResponse['message']);
      }
    }
    catch(exp, stackTrace){
      print("UserRemoteDataSource->login exp");
      print(exp);
      print(stackTrace);
      rethrow;
    }
  }

  @override
  Future<User> register({required String name, required String email, required String password, required String phoneNo}) async{
    try{
      String endPoint =  registerEndpoint;
      print("UserRemoteDataSource->register $endPoint");
      var data = {
        "name" : name,
        "email" : email,
        "phone" : phoneNo,
        "password" : password
      };
      var response = await client.post(endPoint, data: data);
      print("UserRemoteDataSource->register response");
      print(response);
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      Map<String,dynamic> dataResponse = response.data;
      bool status = dataResponse['status'];
      if(status){
        Map<String, dynamic> userJson = dataResponse['data'];
        try{
          User user = UserModel.fromJson(userJson).toEntity();
          return user;
        }
        catch(exp, stackTrace){
          print("user json serialization exp");
          print(exp);
          print(stackTrace);
          rethrow;
        }
      }
      else{
        throw Exception(dataResponse['message']);
      }
    }
    catch(exp, stackTrace){
      print("UserRemoteDataSource->register exp");
      print(exp);
      print(stackTrace);
      rethrow;
    }
  }

}