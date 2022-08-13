import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class TicketStatus {
  int id;
  String name;

  TicketStatus({
    required this.id,
    required this.name,
  });
  
  static  TicketStatus get  sample  => TicketStatus(id: 0, name: "default");
}
