// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

FoodModel foodModelFromJson(String str) => FoodModel.fromJson(json.decode(str));

String foodModelToJson(FoodModel data) => json.encode(data.toJson());

class FoodModel {
  FoodModel({
    this.id,
    this.title,
    this.image,
    this.imageType,
  });

  int? id;
  String? title;
  String? image;
  String? imageType;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        image: json["image"] == null ? null : json["image"],
        imageType: json["imageType"] == null ? null : json["imageType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "image": image == null ? null : image,
        "imageType": imageType == null ? null : imageType,
      };
}
