// To parse this JSON data, do
//
//     final thuthuat = thuthuatFromJson(jsonString);

import 'dart:convert';

List<Thuthuat> thuthuatFromJson(String str) =>
    List<Thuthuat>.from(json.decode(str).map((x) => Thuthuat.fromJson(x)));

String thuthuatToJson(List<Thuthuat> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Thuthuat {
  Thuthuat({
    this.id,
    this.title,
    this.content,
    this.category,
    this.imageSrc,
    this.date,
  });

  int? id;
  String? imageSrc;
  String? title;
  String? content;
  String? date;
  Category? category;

  factory Thuthuat.fromJson(Map<String, dynamic> json) => Thuthuat(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        imageSrc: json['imageSrc'],
        date: json['date'],
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "category": category!.toJson(),
        "imageSrc": imageSrc,
        "date": date
      };
}

class Category {
  Category({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
