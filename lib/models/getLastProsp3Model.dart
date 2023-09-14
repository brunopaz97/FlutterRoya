// To parse this JSON data, do
//
//     final getDataModel = getDataModelFromJson(jsonString);

import 'dart:convert';

GetDataModel getDataModelFromJson(String str) => GetDataModel.fromJson(json.decode(str));

String getDataModelToJson(GetDataModel data) => json.encode(data.toJson());

class GetDataModel {
  Results results;

  GetDataModel({
    required this.results,
  });

  factory GetDataModel.fromJson(Map<String, dynamic> json) => GetDataModel(
    results: Results.fromJson(json["results"]),
  );

  Map<String, dynamic> toJson() => {
    "results": results.toJson(),
  };
}

class Results {
  String temp;
  String hum;
  String press;
  String luz;
  String tempsuelo;
  String humsuelo;

  Results({
    required this.temp,
    required this.hum,
    required this.press,
    required this.luz,
    required this.tempsuelo,
    required this.humsuelo,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    temp: json["temp"],
    hum: json["hum"],
    press: json["press"],
    luz: json["luz"],
    tempsuelo: json["tempsuelo"],
    humsuelo: json["humsuelo"],
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "hum": hum,
    "press": press,
    "luz": luz,
    "tempsuelo": tempsuelo,
    "humsuelo": humsuelo,
  };
}
