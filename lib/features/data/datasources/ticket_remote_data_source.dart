import 'dart:convert';

import 'package:base/features/data/models/ticket_model.dart';
import 'package:base/features/domain/entities/latest_news.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/dreamcatcher/ticket.dart';
import '../const/data.dart';
import '../models/latest_news_model.dart';

abstract class TicketRemoteDataSource {
  Future<List<Ticket>> getTicketList({required String accessToken, required int categoryId, required int pageNo});
  Future<Ticket> addToCart({required String accessToken, required int ticketId, required bool cart});
  Future<Ticket> addToFavourite({required String accessToken, required int ticketId, required bool favourite});
  Future<List<Ticket>> makeOrder({required String accessToken});
}

class TicketRemoteDataSourceImpl implements TicketRemoteDataSource{
  final Dio client;
  TicketRemoteDataSourceImpl({required this.client});

  String _getEndpointByCategory(int categoryId){
    String endpoint = ticketEndpoint;
    switch(categoryId){
      case TICKET_CATEGORY_STORE:
        endpoint = ticketEndpoint;
        break;
      case TICKET_CATEGORY_CART:
        endpoint = cartEndpoint;
        break;
      case TICKET_CATEGORY_FAV:
        endpoint = favouriteEndpoint;
        break;
      case TICKET_CATEGORY_ORDER:
        endpoint = orderEndpoint;
        break;
    }
    return endpoint;
  }
  @override
  Future<List<Ticket>> getTicketList({required String accessToken, required int categoryId, required int pageNo}) async{
    try{
      // method : POST
      // data : accessToken , ticket id and cart

      String endPoint =  _getEndpointByCategory(categoryId) + "?page=$pageNo";

      print("TicketRemoteDataSource->getTicketList for categoryId $categoryId at page $pageNo");
      print("endpoint is $endPoint");

      client.options.headers["Authorization"] = "Bearer ${accessToken}";
      var response = await client.get(endPoint);
      print("TicketRemoteDataSource->getTicketList for categoryId $categoryId at page $pageNo response");
      print(response);
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      Map<String,dynamic> dataResponse = response.data;
      print("dataResponse is ");
      print(dataResponse);
      List<dynamic> ticketListJson = dataResponse['data'];
      List<Ticket> ticketList = [];
      for(int i=0; i < ticketListJson.length; i++){
        try{
          TicketModel ticketModel = TicketModel.fromJson(ticketListJson[i]);
          ticketList.add(ticketModel.toEntity()) ;
        }catch(innerExp, stackTrace){
          print('TicketRemoteDataSource->getTicketList for categoryId $categoryId at page $pageNo  innerExp $innerExp');
          print(stackTrace);
        }
      }
      return ticketList;
    }
    catch(exp, stackTrace){
      print("TicketRemoteDataSource->getTicketList for categoryId $categoryId at page $pageNo  throw exception");
      print(exp);
      print(stackTrace);
      rethrow;
    }
  }

  @override
  Future<Ticket> addToCart({required String accessToken, required int ticketId, required bool cart}) async{
    try{
      // method : POST
      // data : accessToken , ticket id and cart
      Map<String,dynamic> data = {
        "ticket_id":ticketId,
        "cart":cart
      };
      String endPoint =  cartEndpoint;

      print("TicketRemoteDataSource->addToCart for ticketId $ticketId cart $cart");
      print("endpoint is $endPoint");
      print(data);

      client.options.headers["Authorization"] = "Bearer ${accessToken}";
      client.options.headers["Accept"] = "application/json";
      var response = await client.post(endPoint,data: data);
      print("TicketRemoteDataSource->addToCart response");
      print(response);
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      Map<String,dynamic> dataResponse = response.data;
      print("dataResponse is ");
      print(dataResponse);
      Map<String,dynamic> ticketJson = dataResponse['data'];
      try{
        TicketModel ticketModel = TicketModel.fromJson(ticketJson);
        return ticketModel.toEntity();
      }catch(innerExp, stackTrace){
        print('TicketRemoteDataSource->addToCart  innerExp $innerExp');
        print(stackTrace);
        throw innerExp;
      }

    }
    catch(exp, stackTrace){
      print("TicketRemoteDataSource->addToCart throw exception");
      print(exp);
      print(stackTrace);
      rethrow;
    }
  }

  @override
  Future<Ticket> addToFavourite({required String accessToken, required int ticketId, required bool favourite}) async{
    try{
      // method : POST
      // data : accessToken , ticket id and cart
      Map<String,dynamic> data = {
        "ticket_id":ticketId,
        "favourite":favourite
      };
      String endPoint =  favouriteEndpoint;

      print("TicketRemoteDataSource->addToFavourite for ticketId $ticketId favourite $favourite");
      print("endpoint is $endPoint");
      print(data);

      client.options.headers["Authorization"] = "Bearer ${accessToken}";
      var response = await client.post(endPoint,data: data);
      print("TicketRemoteDataSource->addToFavourite response");
      print(response);
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      Map<String,dynamic> dataResponse = response.data;
      print("dataResponse is ");
      print(dataResponse);
      Map<String,dynamic> ticketJson = dataResponse['data'];
      try{
        TicketModel ticketModel = TicketModel.fromJson(ticketJson);
        return ticketModel.toEntity();
      }catch(innerExp, stackTrace){
        print('TicketRemoteDataSource->addToFavourite  innerExp $innerExp');
        print(stackTrace);
        throw innerExp;
      }

    }
    catch(exp, stackTrace){
      print("TicketRemoteDataSource->addToFavourite throw exception");
      print(exp);
      print(stackTrace);
      rethrow;
    }
  }

  @override
  Future<List<Ticket>> makeOrder({required String accessToken}) async{
    try{
      // method : POST
      // data : accessToken , ticket id and cart

      String endPoint =  orderEndpoint;

      print("TicketRemoteDataSource->makeOrder");
      print("endpoint is $endPoint");

      client.options.headers["Authorization"] = "Bearer ${accessToken}";
      var response = await client.post(endPoint);
      print("TicketRemoteDataSource->makeOrder response");
      print(response);
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      Map<String,dynamic> dataResponse = response.data;
      print("dataResponse is ");
      print(dataResponse);
      List<dynamic> ticketListJson = dataResponse['data'];
      List<Ticket> ticketList = [];
      for(int i=0; i < ticketListJson.length; i++){
        try{
          TicketModel ticketModel = TicketModel.fromJson(ticketListJson[i]);
          ticketList.add(ticketModel.toEntity()) ;
        }catch(innerExp, stackTrace){
          print('TicketRemoteDataSource->makeOrder  innerExp $innerExp');
          print(stackTrace);
        }
      }
      return ticketList;
    }
    catch(exp, stackTrace){
      print("TicketRemoteDataSource->makeOrder throw exception");
      print(exp);
      print(stackTrace);
      rethrow;
    }
  }

}