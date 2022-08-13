import 'package:base/features/data/models/downloads_model.dart';
import 'package:base/features/data/models/repeatable_fields_model.dart';
import 'package:base/features/data/models/show_data_model.dart';
import 'package:base/features/data/models/ticket_status_model.dart';
import 'package:base/features/domain/entities/dreamcatcher/ticket.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/dreamcatcher/ticket_status.dart';
import '../../domain/entities/spt/video.dart';
import '../../domain/entities/user.dart';

part 'user_model.g.dart';
@JsonSerializable(explicitToJson: true)
class UserModel {

  @JsonKey(name: 'id', defaultValue: 0)
  int id;

  @JsonKey(name: 'name', defaultValue: "name")
  String name;

  @JsonKey(name: 'email', defaultValue: "email")
  String email;

  @JsonKey(name: 'phone', defaultValue: "phone")
  String phoneNo;

  @JsonKey(name: 'access_token', defaultValue: "access_token")
  String accessToken;

  @JsonKey(name: 'created_at', defaultValue: "created_at")
  String createdAt;

  @JsonKey(name: 'updated_at', defaultValue: "updated_at")
  String updatedAt;

  @JsonKey(name: 'balance', defaultValue: 0)
  int balance;



  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.accessToken,
    required this.createdAt,
    required this.updatedAt,
    required this.balance
  });

  User toEntity(){
    return User(
        id: id,
        name: name,
        email: email,
        phoneNo: phoneNo,
        accessToken: accessToken,
        createdAt: createdAt,
        modifiedAt: updatedAt,
        balance: balance
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>  _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}