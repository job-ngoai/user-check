import 'package:hive/hive.dart';

part 'cookie.model.g.dart';

@HiveType(typeId: 1)
class CookieModel {
  CookieModel({
    this.sb,
    this.fr,
    this.datr,
    this.xs,
    this.cUser,
  });

  @HiveField(0)
  final String? sb;
  @HiveField(1)
  final String? fr;
  @HiveField(2)
  final String? datr;
  @HiveField(3)
  final String? xs;
  @HiveField(4)
  final String? cUser;

  CookieModel copyWith({
    String? sb,
    String? fr,
    String? datr,
    String? xs,
    String? cUser,
  }) =>
      CookieModel(
        sb: sb ?? this.sb,
        fr: fr ?? this.fr,
        datr: datr ?? this.datr,
        xs: xs ?? this.xs,
        cUser: cUser ?? this.cUser,
      );

  factory CookieModel.fromJson(Map<String, dynamic> json) => CookieModel(
        sb: json["sb"],
        fr: json["fr"],
        datr: json["datr"],
        xs: json["xs"],
        cUser: json["c_user"],
      );

  Map<String, dynamic> toJson() => {
        "sb": sb,
        "fr": fr,
        "datr": datr,
        "xs": xs,
        "c_user": cUser,
      };
}
