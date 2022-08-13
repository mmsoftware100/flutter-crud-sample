import 'package:base/features/data/models/downloads_model.dart';
import 'package:base/features/data/models/repeatable_fields_model.dart';
import 'package:base/features/data/models/show_data_model.dart';
import 'package:base/features/data/models/ticket_status_model.dart';
import 'package:base/features/domain/entities/dreamcatcher/ticket.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/dreamcatcher/ticket_status.dart';
import '../../domain/entities/spt/video.dart';

part 'ticket_model.g.dart';
@JsonSerializable(explicitToJson: true)
class TicketModel {

  @JsonKey(name: 'id', defaultValue: 0)
  int id;

  @JsonKey(name: 'name', defaultValue: "name")
  String name;

  @JsonKey(name: 'favourite', defaultValue: false)
  bool favourite;

  @JsonKey(name: 'ticket_status_id', defaultValue: 0)
  int ticketStatusId;

  @JsonKey(name: 'ticket_status', defaultValue: null)
  TicketStatusModel? ticketStatus;



  TicketModel({
    required this.id,
    required this.name,
    required this.favourite,
    required this.ticketStatusId,
    required this.ticketStatus
  });

  Ticket toEntity(){
    return Ticket(
        id: id,
        name: name,
        favourite: favourite,
        ticketStatusId: ticketStatusId,
        ticketStatus: ticketStatus?.toEntity() ?? TicketStatus.sample
    );
  }

  factory TicketModel.fromJson(Map<String, dynamic> json) =>  _$TicketModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketModelToJson(this);

}