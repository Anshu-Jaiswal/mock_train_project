// To parse this JSON data, do
//
//     final rbTrainStoppageResult = rbTrainStoppageResultFromJson(jsonString);

import 'dart:convert';

RbTrainStoppageResult rbTrainStoppageResultFromJson(String str) => RbTrainStoppageResult.fromJson(json.decode(str));

class RbTrainStoppageResult {
  RbTrainStoppageResult({
    required this.listOfStations,
  });

  final List<RbStation> listOfStations;

  factory RbTrainStoppageResult.fromJson(Map<String, dynamic> json) => RbTrainStoppageResult(
        listOfStations: List<RbStation>.from(json["listOfStations"].map((x) => RbStation.fromJson(x))),
      );
}

class RbStation {
  RbStation({
    required this.stationName,
    required this.stationCode,
  });

  final String stationName;
  final String stationCode;

  factory RbStation.fromJson(Map<String, dynamic> json) => RbStation(
        stationName: json["stationName"],
        stationCode: json["stationCode"],
      );
}
