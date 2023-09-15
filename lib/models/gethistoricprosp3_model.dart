// To parse this JSON data, do
//
//     final getDataModel = getDataModelFromJson(jsonString);

import 'dart:convert';

GetDataModel getDataModelFromJson(String str) => GetDataModel.fromJson(json.decode(str));

String getDataModelToJson(GetDataModel data) => json.encode(data.toJson());

class GetDataModel {
  List<Result> results;

  GetDataModel({
    required this.results,
  });

  factory GetDataModel.fromJson(Map<String, dynamic> json) => GetDataModel(
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  String id;
  String temp;
  String hum;
  String press;
  String luz;
  String tempsuelo;
  String humsuelo;
  String readingTime;

  Result({
    required this.id,
    required this.temp,
    required this.hum,
    required this.press,
    required this.luz,
    required this.tempsuelo,
    required this.humsuelo,
    required this.readingTime,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    temp: json["temp"],
    hum: json["hum"],
    press: json["press"],
    luz: json["luz"],
    tempsuelo: json["tempsuelo"],
    humsuelo: json["humsuelo"],
    readingTime: json["reading_time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "temp": temp,
    "hum": hum,
    "press": press,
    "luz": luz,
    "tempsuelo": tempsuelo,
    "humsuelo": humsuelo,
    "reading_time": readingTime,
  };
}
