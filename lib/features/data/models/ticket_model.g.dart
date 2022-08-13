// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketModel _$TicketModelFromJson(Map<String, dynamic> json) => TicketModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'name',
      favourite: json['favourite'] as bool? ?? false,
      ticketStatusId: json['ticket_status_id'] as int? ?? 0,
      ticketStatus: json['ticket_status'] == null
          ? null
          : TicketStatusModel.fromJson(
              json['ticket_status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketModelToJson(TicketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'favourite': instance.favourite,
      'ticket_status_id': instance.ticketStatusId,
      'ticket_status': instance.ticketStatus?.toJson(),
    };
