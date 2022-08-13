import 'package:base/features/domain/entities/dreamcatcher/ticket_status.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Ticket{
  int id;
  String name;
  bool favourite;
  int ticketStatusId;
  TicketStatus ticketStatus;

  Ticket({
    required this.id,
    required this.name,
    required this.favourite,
    required this.ticketStatusId,
    required this.ticketStatus
  });

  static Ticket get sample  => Ticket(id: 0, name: "name", favourite: false, ticketStatusId: TicketStatus.sample.id, ticketStatus: TicketStatus.sample);
}
