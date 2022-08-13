import 'bet.dart';
class BetTime{
  int id;
  String time;

  BetTime({
    required this.id,
    required this.time
  });

  static BetTime sample () => BetTime(id: 0,time: "time");
}