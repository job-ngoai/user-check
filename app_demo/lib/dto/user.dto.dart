// To parse this JSON data, do
//
//     final userDto = userDtoFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';

part 'user.dto.g.dart';

UserDto userDtoFromJson(String str) => UserDto.fromJson(json.decode(str));

String userDtoToJson(UserDto data) => json.encode(data.toJson());

@HiveType(typeId: 2)
class UserDto {
  UserDto({
    this.username,
    this.password,
    this.hasCheckpoint,
    this.cookie,
    this.ipAddress,
    this.country,
  });

  @HiveField(0)
  String? username;
  @HiveField(1)
  String? password;
  @HiveField(2)
  bool? hasCheckpoint;
  @HiveField(3)
  String? cookie;
  @HiveField(4)
  String? ipAddress;
  @HiveField(5)
  String? country;

  UserDto copyWith({
    String? username,
    String? password,
    bool? hasCheckpoint,
    String? cookie,
    String? ipAddress,
    String? country,
  }) =>
      UserDto(
          username: username ?? this.username,
          password: password ?? this.password,
          hasCheckpoint: hasCheckpoint ?? this.hasCheckpoint,
          cookie: cookie ?? this.cookie,
          ipAddress: ipAddress ?? this.ipAddress,
          country: country ?? this.country);

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        username: json["username"],
        password: json["password"],
        hasCheckpoint: json["HasCheckpoint"],
        cookie: json["cookie"],
        ipAddress: json["ipAddress"],
        country: json['country'],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "hasCheckpoint": hasCheckpoint,
        "cookie": cookie,
        "ipAddress": ipAddress,
        "country": country,
      };
}
