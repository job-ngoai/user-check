// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'user.model.g.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class User {
  User({
    this.username,
    this.password,
    this.cookie,
    this.ipAddress,
    this.country,
  });
  @HiveField(0)
  final String? username;
  @HiveField(1)
  final String? password;
  @HiveField(2)
  String? cookie;
  @HiveField(3)
  final String? ipAddress;
  @HiveField(4)
  final String? country;
  User copyWith({
    String? username,
    String? password,
    String? cookie,
    String? xs,
    String? token,
    String? ipAddress,
    String? country,
  }) =>
      User(
          username: username ?? this.username,
          password: password ?? this.password,
          cookie: cookie ?? this.cookie,
          ipAddress: ipAddress ?? this.ipAddress,
          country: country ?? this.country);

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        password: json["password"],
        cookie: json["cookie"],
        ipAddress: json['ipAddress'],
        country: json['country'],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "cookie": cookie,
        "ipAddress": ipAddress,
        "country": country,
      };
}
