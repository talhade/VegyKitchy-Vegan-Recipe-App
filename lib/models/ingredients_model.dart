// To parse this JSON data, do
//
//     final ingredientsModel = ingredientsModelFromJson(jsonString);

import 'dart:convert';

IngredientsModel ingredientsModelFromJson(String str) =>
    IngredientsModel.fromJson(json.decode(str));

String ingredientsModelToJson(IngredientsModel data) =>
    json.encode(data.toJson());

class IngredientsModel {
  IngredientsModel({
    this.name,
    this.image,
    this.amount,
  });

  String? name;
  String? image;
  Amount? amount;

  factory IngredientsModel.fromJson(Map<String, dynamic> json) =>
      IngredientsModel(
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
        amount: json["amount"] == null ? null : Amount.fromJson(json["amount"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "image": image == null ? null : image,
        "amount": amount == null ? null : amount!.toJson(),
      };
}

class Amount {
  Amount({
    this.metric,
    this.us,
  });

  Metric? metric;
  Metric? us;

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
        metric: json["metric"] == null ? null : Metric.fromJson(json["metric"]),
        us: json["us"] == null ? null : Metric.fromJson(json["us"]),
      );

  Map<String, dynamic> toJson() => {
        "metric": metric == null ? null : metric!.toJson(),
        "us": us == null ? null : us!.toJson(),
      };
}

class Metric {
  Metric({
    this.value,
    this.unit,
  });

  double? value;
  String? unit;

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
        value: json["value"] == null ? null : json["value"].toDouble(),
        unit: json["unit"] == null ? null : json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
        "unit": unit == null ? null : unit,
      };
}
