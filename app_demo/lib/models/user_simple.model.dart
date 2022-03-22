// To parse this JSON data, do
//
//     final userSimple = userSimpleFromJson(jsonString);

import 'dart:convert';

UserSimple userSimpleFromJson(String str) =>
    UserSimple.fromJson(json.decode(str));

String userSimpleToJson(UserSimple data) => json.encode(data.toJson());

class UserSimple {
  UserSimple({
    this.username,
    this.password,
  });

  final String? username;
  final String? password;

  UserSimple copyWith({
    String? username,
    String? password,
  }) =>
      UserSimple(
        username: username ?? this.username,
        password: password ?? this.password,
      );

  factory UserSimple.fromJson(Map<String, dynamic> json) => UserSimple(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
