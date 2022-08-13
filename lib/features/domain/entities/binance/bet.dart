class Bet{
  int digit;
  int amount;

  Bet({
    required this.digit,
    required this.amount
  });

  String get digitFormated => digit.toString().padLeft(2,"0");
  static Bet sample () => Bet(digit: -1, amount: 0);
}