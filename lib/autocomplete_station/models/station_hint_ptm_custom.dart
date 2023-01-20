// To parse this JSON data, do
//
//     final ptmStationHintResult = ptmStationHintResultFromJson(jsonString);

import 'dart:convert';

PtmStationHintResult ptmStationHintResultFromJson(String str) =>
    PtmStationHintResult.fromJson(json.decode(str));

class PtmStationHintResult {
  PtmStationHintResult({
    required this.body,
  });

  final List<Body> body;

  factory PtmStationHintResult.fromJson(Map<String, dynamic> json) =>
      PtmStationHintResult(
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
      );
}

class Body {
  Body({
    required this.stations,
  });

  final List<Station> stations;

  factory Body.fromJson(Map<String, dynamic> json) =>
      Body(
        stations: List<Station>.from(
            json["stations"].map((x) => Station.fromJson(x))),
      );
}

class Station {
  Station({
    required
    this.data
    ,
  });

  final Data? data;

  factory Station.fromJson(Map<String, dynamic> json) =>
      Station(data: json["expandable"] ? null : Data.fromJson(json["data"]));
}

class Data {
  Data({
    required
    this.name
    ,
    required this.displayLocation,
    required this.code,
  });

  final String name;
  final String displayLocation;
  final String code;

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(
        name: json["name"],
        displayLocation: json["display_location"],
        code: json["code"],
      );
}
