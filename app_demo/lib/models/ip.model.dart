// To parse this JSON data, do
//
//     final ipModel = ipModelFromJson(jsonString);

import 'dart:convert';

IpModel ipModelFromJson(String str) => IpModel.fromJson(json.decode(str));

String ipModelToJson(IpModel data) => json.encode(data.toJson());

class IpModel {
  IpModel({
    this.ip,
    this.city,
    this.region,
    this.country,
    this.loc,
    this.org,
    this.postal,
    this.timezone,
  });

  final String? ip;
  final String? city;
  final String? region;
  final String? country;
  final String? loc;
  final String? org;
  final String? postal;
  final String? timezone;

  IpModel copyWith({
    String? ip,
    String? city,
    String? region,
    String? country,
    String? loc,
    String? org,
    String? postal,
    String? timezone,
  }) =>
      IpModel(
        ip: ip ?? this.ip,
        city: city ?? this.city,
        region: region ?? this.region,
        country: country ?? this.country,
        loc: loc ?? this.loc,
        org: org ?? this.org,
        postal: postal ?? this.postal,
        timezone: timezone ?? this.timezone,
      );

  factory IpModel.fromJson(Map<String, dynamic> json) => IpModel(
        ip: json["ip"],
        city: json["city"],
        region: json["region"],
        country: json["country"],
        loc: json["loc"],
        org: json["org"],
        postal: json["postal"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "ip": ip,
        "city": city,
        "region": region,
        "country": country,
        "loc": loc,
        "org": org,
        "postal": postal,
        "timezone": timezone,
      };
}
