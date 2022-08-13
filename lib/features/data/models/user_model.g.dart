// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'name',
      email: json['email'] as String? ?? 'email',
      phoneNo: json['phone'] as String? ?? 'phone',
      accessToken: json['access_token'] as String? ?? 'access_token',
      createdAt: json['created_at'] as String? ?? 'created_at',
      updatedAt: json['updated_at'] as String? ?? 'updated_at',
      balance: json['balance'] as int? ?? 0,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phoneNo,
      'access_token': instance.accessToken,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'balance': instance.balance,
    };
