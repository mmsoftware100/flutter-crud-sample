class QuickSelect{
  int id;
  String name;
  List<int> digitList;

  QuickSelect({
    required this.id,
    required this.name,
    required this.digitList
  });

  static QuickSelect sample () => QuickSelect(id: 0, name: "name", digitList: []);
}