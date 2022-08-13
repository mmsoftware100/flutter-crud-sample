import 'package:base/features/data/models/downloads_model.dart';
import 'package:base/features/data/models/repeatable_fields_model.dart';
import 'package:base/features/data/models/show_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/dreamcatcher/ticket_status.dart';
import '../../domain/entities/spt/video.dart';

part 'ticket_status_model.g.dart';
@JsonSerializable(explicitToJson: true)
class TicketStatusModel {

  @JsonKey(name: 'id', defaultValue: 0)
  int id;

  @JsonKey(name: 'name', defaultValue: "name")
  String name;

  TicketStatusModel({
    required this.id,
    required this.name
  });

  TicketStatus toEntity(){
    return TicketStatus(
        id: id,
        name: name
    );
  }

  factory TicketStatusModel.fromJson(Map<String, dynamic> json) =>  _$TicketStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketStatusModelToJson(this);

}