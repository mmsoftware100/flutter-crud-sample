import 'package:base/features/domain/entities/binance/bet_time.dart';
import 'package:base/features/domain/entities/binance/bet_type.dart';

import 'bet.dart';
class Intake{
  DateTime dateTime;
  // String time;
  List<Bet> bets;
  int betTimeId;
  BetTime betTime;
  int betTypeId;
  BetType betType;

  Intake({
    required this.dateTime,
    // required this.time,
    required this.bets,
    required this.betTimeId,
    required this.betTime,
    required this.betTypeId,
    required this.betType
  });

  static Intake sample () => Intake(dateTime: DateTime.now(), betTimeId: BetTime.sample().id, bets: [], betTime: BetTime.sample(), betTypeId: BetType.sample().id, betType: BetType.sample());

  String get time => betTime.time;
  String get date => dateTime.year.toString().padLeft(4,"0")+"-"+dateTime.month.toString().padLeft(2,"0")+"-"+dateTime.day.toString().padLeft(2,"0");
}