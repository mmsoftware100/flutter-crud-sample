// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketStatusModel _$TicketStatusModelFromJson(Map<String, dynamic> json) =>
    TicketStatusModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'name',
    );

Map<String, dynamic> _$TicketStatusModelToJson(TicketStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
