class BetType{
  int id;
  String name;

  BetType({
    required this.id,
    required this.name
  });

  static BetType sample () => BetType(id: 0, name: "name");
}