// To parse this JSON data, do
//
//     final baseResponse = baseResponseFromJson(jsonString);

import 'dart:convert';

BaseResponse baseResponseFromJson(String str) =>
    BaseResponse.fromJson(json.decode(str));

String baseResponseToJson(BaseResponse data) => json.encode(data.toJson());

class BaseResponse {
  BaseResponse({
    this.statusCode,
    this.message,
    this.result,
  });

  final int? statusCode;
  final String? message;
  final bool? result;

  BaseResponse copyWith({
    int? statusCode,
    String? message,
    bool? result,
  }) =>
      BaseResponse(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        result: result ?? this.result,
      );

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        statusCode: json["statusCode"],
        message: json["message"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "result": result,
      };
}
