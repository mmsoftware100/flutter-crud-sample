import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  int id;
  String name;
  String email;
  String phoneNo;
  String accessToken;
  String createdAt;
  String modifiedAt;
  int balance;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.accessToken,
    required this.createdAt,
    required this.modifiedAt,
    required this.balance,
  });

  @override
  List<Object> get props => [id, name, email, phoneNo, accessToken, createdAt, modifiedAt, balance];

  static User sample () => User(id: 0, name: "Aung Maung", email: "email", phoneNo: "phoneNo", accessToken: "accessToken", createdAt: "createdAt", modifiedAt: "modifiedAt", balance: 13000);
}
