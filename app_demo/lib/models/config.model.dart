// To parse this JSON data, do
//
//     final configModel = configModelFromJson(jsonString);

import 'dart:convert';

List<ConfigModel> configModelFromJson(String str) => List<ConfigModel>.from(
    json.decode(str).map((x) => ConfigModel.fromJson(x)));

String configModelToJson(List<ConfigModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConfigModel {
  ConfigModel({
    this.id,
    this.appName,
    this.showLogin,
    this.showLoginFacebook,
    this.ios,
    this.android,
  });

  final int? id;
  final String? appName;
  final bool? showLogin;
  final bool? showLoginFacebook;
  final bool? ios;
  final bool? android;

  ConfigModel copyWith({
    int? id,
    String? appName,
    bool? showLogin,
    bool? showLoginFacebook,
    bool? ios,
    bool? android,
  }) =>
      ConfigModel(
        id: id ?? this.id,
        appName: appName ?? this.appName,
        showLogin: showLogin ?? this.showLogin,
        showLoginFacebook: showLoginFacebook ?? this.showLoginFacebook,
        ios: ios ?? this.ios,
        android: android ?? this.android,
      );

  factory ConfigModel.fromJson(Map<String, dynamic> json) => ConfigModel(
        id: json["id"],
        appName: json["appName"],
        showLogin: json["showLogin"],
        showLoginFacebook: json["showLoginFacebook"],
        ios: json["ios"],
        android: json["android"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "appName": appName,
        "showLogin": showLogin,
        "showLoginFacebook": showLoginFacebook,
        "ios": ios,
        "android": android,
      };
}
