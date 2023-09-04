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
  String tempsuelo;
  String humsuelo;

  Results({
    required this.tempsuelo,
    required this.humsuelo,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
    tempsuelo: json["tempsuelo"],
    humsuelo: json["humsuelo"],
  );

  Map<String, dynamic> toJson() => {
    "tempsuelo": tempsuelo,
    "humsuelo": humsuelo,
  };
}
