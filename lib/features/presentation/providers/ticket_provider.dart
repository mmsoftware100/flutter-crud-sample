

import 'package:base/core/error/failures.dart';
import 'package:base/features/data/const/data.dart';
import 'package:base/features/domain/entities/dreamcatcher/ticket_status.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/usecases/add_to_cart.dart';
import 'package:base/features/domain/usecases/add_to_favourite.dart';
import 'package:base/features/domain/usecases/get_ticket_list.dart';
import 'package:base/features/domain/usecases/user_register.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/dreamcatcher/ticket.dart';
import '../../domain/usecases/make_order.dart';
import '../../domain/usecases/user_login.dart';
class TicketProvider extends ChangeNotifier {

  final GetTicketList getTicketList;
  final AddToCart addToCart;
  final AddToFavourite addToFavourite;
  final MakeOrder makeOrder;

  TicketProvider({
    required this.getTicketList,
    required this.addToCart,
    required this.addToFavourite,
    required this.makeOrder
  });

  List<Ticket> ticketRepo = [
    Ticket(id: 1, name: "ကခ ၁၂၃ ၄၅၆", favourite: false, ticketStatusId: 0, ticketStatus: TicketStatus(id: 0, name: "default")),
    Ticket(id: 2, name: "ခ ၄၃၅ ၆၅၄", favourite: true, ticketStatusId: 0, ticketStatus: TicketStatus(id: 0, name: "default")),
    Ticket(id: 3, name: "င ၄၅၃ ၆၃၂", favourite: true, ticketStatusId: 0, ticketStatus: TicketStatus(id: 0, name: "default")),
    Ticket(id: 4, name: "မ ၆၄၃ ၃၃၂", favourite: false, ticketStatusId: 0, ticketStatus: TicketStatus(id: 0, name: "default")),
    Ticket(id: 4, name: "ဂ ၄၅၄ ၃၂၁", favourite: false, ticketStatusId: 1, ticketStatus: TicketStatus(id: 1, name: "add_to_cart")),
    Ticket(id: 4, name: "ဂ ၅၄၅ ၃၃၂", favourite: false, ticketStatusId: 1, ticketStatus: TicketStatus(id: 1, name: "add_to_cart")),
    Ticket(id: 4, name: "ဗ ၅၄၅ ၃၃၂", favourite: false, ticketStatusId: 2, ticketStatus: TicketStatus(id: 2, name: "purchased")),
    Ticket(id: 4, name: "ဗ ၅၄၅ ၃၃၂", favourite: false, ticketStatusId: 2, ticketStatus: TicketStatus(id: 2, name: "purchased")),
  ];

  List<Ticket> ticketStoreRepo = [];
  List<Ticket> ticketCartRepo = [];
  List<Ticket> ticketFavRepo = [];
  List<Ticket> ticketOrderRepo = [];

  int storePageNo = 1;
  int cartPageNo = 1;
  int favPageNo = 1;
  int orderPageNo = 1;
  /*
  List<Ticket> ticketStoreRepo = [];
  List<Ticket> ticketFavouriteRepo = [];
  List<Ticket> ticketCartRepo = [];
  List<Ticket> ticketOrderRepo = [];
   */





  // pagination section
  int _getPageNo(int categoryId){
    int pageNo = 1;
    switch(categoryId){
      case TICKET_CATEGORY_STORE:
        pageNo = storePageNo;
        break;
      case TICKET_CATEGORY_CART:
        pageNo = cartPageNo;
        break;
      case TICKET_CATEGORY_FAV:
        pageNo = favPageNo;
        break;
      case TICKET_CATEGORY_ORDER:
        pageNo = orderPageNo;
        break;
    }
    return pageNo;
  }
  void _increasePageNo(int categoryId){
    switch(categoryId){
      case TICKET_CATEGORY_STORE:
        storePageNo++;
        break;
      case TICKET_CATEGORY_CART:
        cartPageNo++;
        break;
      case TICKET_CATEGORY_FAV:
        favPageNo++;
        break;
      case TICKET_CATEGORY_ORDER:
        orderPageNo++;
        break;
    }
  }
  void _resetPageNo(int categoryId){
    switch(categoryId){
      case TICKET_CATEGORY_STORE:
        storePageNo = 1;
        ticketStoreRepo.clear();
        break;
      case TICKET_CATEGORY_CART:
        cartPageNo = 1;
        ticketCartRepo.clear();
        break;
      case TICKET_CATEGORY_FAV:
        favPageNo = 1;
        ticketFavRepo.clear();
        break;
      case TICKET_CATEGORY_ORDER:
        orderPageNo = 1;
        ticketOrderRepo.clear();
        break;
    }
  }
  void _addTickets(int categoryId, List<Ticket> ticketList){
    print("_addTickets for categoryId $categoryId");
    print(ticketList);
    switch(categoryId){
      case TICKET_CATEGORY_STORE:
        ticketStoreRepo.addAll(ticketList);
        break;
      case TICKET_CATEGORY_CART:
        ticketCartRepo.addAll(ticketList);
        break;
      case TICKET_CATEGORY_FAV:
        ticketFavRepo.addAll(ticketList);
        break;
      case TICKET_CATEGORY_ORDER:
        ticketOrderRepo.addAll(ticketList);
        break;
    }
    print(ticketList);
  }

  // main use case for loading data | initial and pagination
  Future<bool> getTicketListPlz({required String accessToken, required int categoryId})async{
    final Either<Failure, List<Ticket>> ticketListEither = await getTicketList(GetTicketListParams(
      accessToken: accessToken,
      categoryId: categoryId,
      pageNo: _getPageNo(categoryId)
    ));
    return ticketListEither.fold(
            (failure)  {
          // specify failure
          print("TicketProvider->getTicketListPlz->failure for category id $categoryId");
          print(failure);
          // _addTickets(categoryId, ticketRepo);
          notifyListeners();
          return false;
        },
            (ticketList)  {
          print("TicketProvider->getTicketListPlz->ticketList for category id $categoryId");
          print(ticketList);
          _increasePageNo(categoryId);
          _addTickets(categoryId, ticketList);
          // ticketRepo.addAll(ticketList); // = ticketList;
          notifyListeners();
          return true;
        }
    );
  }

  // main data reset / refresh method especially for refresh
  Future<bool> refreshTicketPlz({required String accessToken, required int categoryId})async{
    _resetPageNo(categoryId);
    final Either<Failure, List<Ticket>> ticketListEither = await getTicketList(GetTicketListParams(
        accessToken: accessToken,
        categoryId: categoryId,
        pageNo: _getPageNo(categoryId)
    ));
    return ticketListEither.fold(
            (failure)  {
          // specify failure
          print("TicketProvider->refreshTicketPlz->failure");
          print(failure);
          _addTickets(categoryId, ticketRepo);
          notifyListeners();
          return false;
        },
            (ticketList)  {
          print("TicketProvider->refreshTicketPlz->ticketList");
          print(ticketList);
          _increasePageNo(categoryId);
          _addTickets(categoryId, ticketList);
          notifyListeners();
          return true;
        }
    );
  }

  // add to cart / remove from cart using parameter , since we don't care about favourite_id of database
  Future<bool> addToCartPlz({required String accessToken, required int ticketId, required bool cart})async{
    final Either<Failure, Ticket> ticketEither = await addToCart(AddToCartParams(
        accessToken: accessToken,
        ticketId: ticketId,
        cart: cart
    ));
    return ticketEither.fold(
            (failure)  {
          // specify failure
          print("TicketProvider->addToCartPlz->failure");
          print(failure);
          notifyListeners();
          return false;
        },
            (ticket)  {
          print("TicketProvider->addToCartPlz->ticketList");
          // should add / update ticket from ticket repo
          _updateTicket(ticket, ticketStoreRepo);
          _addOrUpdateTicket(ticket, ticketCartRepo);
          _updateTicket(ticket, ticketOrderRepo,);
          _updateTicket(ticket, ticketFavRepo);
          // TODO: remove from cart
          notifyListeners();
          return true;
        }
    );
  }


  // add to favourite / remove from favourite using parameter , since we don't care about favourite_id of database
  Future<bool> addToFavouritePlz({required String accessToken, required int ticketId, required bool favourite})async{
    print("TicketProvider->addToFavouritePlz");
    final Either<Failure, Ticket> ticketEither = await addToFavourite(AddToFavouriteParams(
        accessToken: accessToken,
        ticketId: ticketId,
        favourite: favourite
    ));
    return ticketEither.fold(
            (failure)  {
          // specify failure
          print("TicketProvider->addToFavouritePlz->failure");
          print(failure);
          notifyListeners();
          return false;
        },
            (ticket)  {
          print("TicketProvider->addToFavouritePlz->ticket");
          // should add / update ticket from ticket repo
          _addOrUpdateTicket(ticket, ticketStoreRepo);
          _addOrUpdateTicket(ticket, ticketFavRepo);
          _updateTicket(ticket, ticketOrderRepo);
          _updateTicket(ticket, ticketCartRepo);

          // TODO: remove from favourite if favourite is false
          if(!ticket.favourite){
            _deleteTicket(ticket, ticketFavRepo);
          }
          notifyListeners();
          return true;
        }
    );
  }

  // make order
  Future<bool> makeOrderPlz({required String accessToken})async{
    final Either<Failure, List<Ticket>> ticketListEither = await makeOrder(MakeOrderParams(
        accessToken: accessToken
    ));
    return ticketListEither.fold(
            (failure)  {
          // specify failure
          print("TicketProvider->makeOrderPlz->failure");
          print(failure);
          notifyListeners();
          return false;
        },
            (ticketList)  {
          print("TicketProvider->makeOrderPlz->ticketList");
          print(ticketList);
          _addTickets(TICKET_CATEGORY_ORDER, ticketList);
          notifyListeners();
          return true;
        }
    );
  }
  void _addOrUpdateTicket(Ticket ticket, List<Ticket> ticketList){
    bool insert = true;
    for(int i=0; i < ticketList.length; i++){
      if(ticketList[i].id == ticket.id){
        insert = false;
        ticketList[i] = ticket;
      }
    }
    if(insert){
      ticketList.add(ticket);
    }
  }
  void _updateTicket(Ticket ticket, List<Ticket> ticketList){
    for(int i=0; i < ticketList.length; i++){
      if(ticketList[i].id == ticket.id){
        ticketList[i] = ticket;
      }
    }
  }
  void _deleteTicket(Ticket ticket, List<Ticket> ticketList){
    int index = -1;
    for(int i=0; i < ticketList.length; i++){
      if(ticketList[i].id == ticket.id){
        index = i;
      }
    }
    if(index >= 0){
      ticketList.removeAt(index);
    }
  }

}
