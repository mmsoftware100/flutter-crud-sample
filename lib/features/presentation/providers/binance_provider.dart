

import 'package:base/core/error/failures.dart';
import 'package:base/features/data/const/data.dart';
import 'package:base/features/domain/entities/binance/bet.dart';
import 'package:base/features/domain/entities/binance/bet_type.dart';
import 'package:base/features/domain/entities/binance/intake.dart';
import 'package:base/features/domain/entities/binance/quick_select.dart';
import 'package:base/features/domain/entities/binance/transaction.dart';
import 'package:base/features/domain/entities/dreamcatcher/ticket_status.dart';
import 'package:base/features/domain/entities/user.dart';
import 'package:base/features/domain/usecases/add_to_cart.dart';
import 'package:base/features/domain/usecases/add_to_favourite.dart';
import 'package:base/features/domain/usecases/get_ticket_list.dart';
import 'package:base/features/domain/usecases/user_register.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/binance/bet_time.dart';
import '../../domain/entities/dreamcatcher/ticket.dart';
import '../../domain/usecases/make_order.dart';
import '../../domain/usecases/user_login.dart';
class BinanceProvider extends ChangeNotifier {
  // home page tap တွေကို ထိမ်းထားပေးမယ့် repo
  // R
  Intake currentIntake = Intake.sample();
  Intake confirmedIntake = Intake.sample();
  List<QuickSelect> quickSelects = quickSelectList;
  List<BetType> betTypes = betTypeList;

  List<Intake> intakeList = [
    Intake(dateTime: DateTime.now(),
        bets: [
          Bet(digit: 0, amount: 100),
          Bet(digit: 10, amount: 200),
          Bet(digit: 25, amount: 200),
          Bet(digit: 88, amount: 150),
        ],
        betTimeId: betTime10AM.id,
        betTime: betTime10AM,
        betTypeId: betTypeMyanmar.id,
        betType: betTypeMyanmar
    ),
    Intake(dateTime: DateTime.now(), bets: [
      Bet(digit: 85, amount: 400),
      Bet(digit: 52, amount: 200),
      Bet(digit: 47, amount: 450),
      Bet(digit: 88, amount: 650),
    ], betTimeId: betTime02PM.id, betTime: betTime02PM, betTypeId: betTypeCrypto.id, betType: betTypeCrypto),
    Intake(dateTime: DateTime.now(), bets: [
      Bet(digit: 78, amount: 100),
      Bet(digit: 42, amount: 200),
      Bet(digit: 5, amount: 200),
      Bet(digit: 86, amount: 150),
    ], betTimeId: betTime04PM.id, betTime: betTime04PM, betTypeId: betTypeMyanmar.id, betType: betTypeMyanmar),
  ];

  List<Transaction> transactionList = [
    Transaction(id: 1, ops: "ငွေသွင်း", amount: 150000, date: DateTime.now(), time: "10:00 AM"),
    Transaction(id: 1, ops: "ငွေထုတ်", amount: 50000, date: DateTime.now(), time: "10:00 AM"),
    Transaction(id: 1, ops: "လောင်းကြေး", amount: 4500, date: DateTime.now(), time: "10:00 AM"),
    Transaction(id: 1, ops: "ပေါက်", amount: 65300, date: DateTime.now(), time: "10:00 AM"),
    Transaction(id: 1, ops: "ငွေထုတ်", amount: 14500, date: DateTime.now(), time: "10:00 AM"),
    Transaction(id: 1, ops: "ငွေသွင်း", amount: 7800, date: DateTime.now(), time: "10:00 AM"),
  ];

  // List<Bet> currentBetsRepo = [];
  // for bet confirmed screen
  // List<Bet> confirmedBetRepo = [];
  void resetBetRepo(){
    //currentBetsRepo.clear();
    //confirmedBetRepo.clear();
    currentIntake = Intake.sample();
    confirmedIntake = Intake.sample();
    notifyListeners();
  }
  // C
  void addBet(Bet bet){
    // currentBetsRepo.add(bet);
    currentIntake.bets.add(bet);
    notifyListeners();
  }
  // Delete
  void removeBet(Bet bet){
    print("BinanceProvider->removeBet");
    //print(currentBetsRepo.length);
    //currentBetsRepo.removeWhere((element) => element.digit == bet.digit);
    // print(currentBetsRepo.length);
    currentIntake.bets.removeWhere((element) => element.digit == bet.digit);
    notifyListeners();
  }
  // U
  void updateBet(Bet bet){
    for(int i=0; i < currentIntake.bets.length; i++){
      if(currentIntake.bets[i].digit == bet.digit){
        currentIntake.bets[i].amount = bet.amount;
      }
    }
    notifyListeners();
  }

  Future<bool> makeOrder()async{
    confirmedIntake = currentIntake;
    notifyListeners();
    return Future.delayed(Duration(seconds: 3),(){
      return true;
    });

  }
  // calculated values
  // ticket count
  int get currentBetsRepoLength => currentIntake.bets.length;
  // ticket total amount
  int get currentBetsRepoTotalAmount {
    int total = 0;
    currentIntake.bets.forEach((element) {
      total += element.amount;
    });
    return total;
  }
  // ရွေးထားသလား သိချင်လို့
  bool selectedBet(Bet bet){
    bool selected = false;
    for (var value in currentIntake.bets) {
      if(value.digit == bet.digit){
        selected = true;
      }
    }
    return selected;
  }

  // TODO: ဒါက Api call ခေါ် ရမယ့် သဘော ရှိတယ်။
  List<BetTime> currentAvailableBetTimes(){
    List<BetTime> betTimes = [...betTimeList]; // avoid pass by reference
    DateTime currentDateTime = DateTime.now();
    int hour = currentDateTime.hour;

    return betTimes;
    //ver b = betTimes.removeAt(0);
    // remove index
    /*
    if(hour < 10){
      return betTimes; // return all
    }

     */
    if(hour >= 10 && hour < 12){
      betTimes.removeAt(0); // return all
    }
    if(hour >= 12 && hour < 14){
      betTimes.removeRange(0, 1);
    }
    if(hour >= 14 && hour < 16){
      betTimes.removeRange(0, 2);
    }
    if(hour >= 16 && hour < 18){
      betTimes.removeRange(0, 3);
    }
    if(hour >= 18){
      betTimes = [];
    }
    if(betTimes.length > 1) betTimes = [betTimes.first];
    return betTimes;
  }

  void setBetTime(BetTime betTime){
    currentIntake.betTime = betTime;
    currentIntake.betTimeId = betTime.id;
    currentIntake.bets = [];
    notifyListeners();
  }

  // set all bet amount
  void onAmountChange(int amount){
    for(int i=0; i < currentIntake.bets.length; i++){
      currentIntake.bets[i].amount = amount;
    }
    notifyListeners();
  }

  String get currentIntakeInfo {
    if(currentIntake.bets.isEmpty){
      return "No ticket is selected, Please select one";
    }
    String info = "";
    info += currentIntake.bets.length.toString() + " Tickets ( "+currentTotalAmount.toString()+" )";
    return info;
  }

  int get currentTotalAmount {
    int total = 0;
    currentIntake.bets.forEach((element) {
      total += element.amount;
    });
    return total;
  }

  void setQuickSelect(QuickSelect quickSelect){
    currentIntake.bets = [];
    for (int digit in quickSelect.digitList) {
      currentIntake.bets.add(Bet(digit: digit, amount: minBetAmount));
    }
    notifyListeners();
  }

  void makeReverse(){
    List<Bet> bets = [];
    for(int i=0; i < currentIntake.bets.length; i++){
      Bet newBet = Bet(digit: int.tryParse(currentIntake.bets[i].digitFormated.split('').reversed.join('')) ?? currentIntake.bets[i].digit, amount: currentIntake.bets[i].amount);
      // bet.digit =  int.tryParse(bet.digitFormated.split('').reversed.join('')) ?? bet.digit ;
      // need to decide add or remove
      if(selectedBet(newBet) ){

      }
      else{
        bets.add(newBet);
      }
    }
    /*
    for (Bet bet in currentIntake.bets) {
      bet.digit = int.tryParse(bet.digitFormated.split('').reversed.join('')) ?? bet.digit ;
      bets.add(bet);
    }

     */
    currentIntake.bets.addAll(bets);
    notifyListeners();
  }

}
