class Transaction{
  int id;
  // need to separate
  String ops;
  int amount;
  DateTime date;
  String time;

  Transaction({
    required this.id,
    required this.ops,
    required this.amount,
    required this.date,
    required this.time
  });


  static Transaction sample () => Transaction(id: 0, ops: "ops", amount: 0, date: DateTime.now(), time: "time");
}