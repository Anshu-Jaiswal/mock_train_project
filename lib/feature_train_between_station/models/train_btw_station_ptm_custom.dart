// To parse this JSON data, do
//
//     final ptmTrainBtwStationResult = ptmTrainBtwStationResultFromJson(jsonString);

import 'dart:convert';

PtmTrainBtwStationResult ptmTrainBtwStationResultFromJson(String str) =>
    PtmTrainBtwStationResult.fromJson(json.decode(str));

class PtmTrainBtwStationResult {
  PtmTrainBtwStationResult({
    required this.body,
  });

  final Body body;

  factory PtmTrainBtwStationResult.fromJson(Map<String, dynamic> json) => PtmTrainBtwStationResult(
        body: Body.fromJson(json["body"]),
      );
}

class Body {
  Body({
    required this.trains,
  });

  final List<Train> trains;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        trains: List<Train>.from(json["trains"].map((x) => Train.fromJson(x))),
      );
}

class Train {
  Train({
    required this.departure,
    required this.arrival,
    required this.trainFullName,
    required this.trainNumber,
    required this.source,
    required this.destination,
    required this.sourceName,
    required this.destinationName,
    required this.duration,
    required this.runningOn,
    required this.classes,
  });

  final DateTime departure;
  final DateTime arrival;
  final String trainFullName;
  final String trainNumber;
  final String source;
  final String destination;
  final String sourceName;
  final String destinationName;
  final String duration;
  final RunningOn runningOn;
  final List<String> classes;

  factory Train.fromJson(Map<String, dynamic> json) => Train(
        departure: DateTime.parse(json["departure"]),
        arrival: DateTime.parse(json["arrival"]),
        trainFullName: json["trainFullName"],
        trainNumber: json["trainNumber"],
        source: json["source"],
        destination: json["destination"],
        sourceName: json["source_name"],
        destinationName: json["destination_name"],
        duration: json["duration"],
        runningOn: RunningOn.fromJson(json["runningOn"]),
        classes: List<String>.from(json["classes"].map((x) => x)),
      );
}

class RunningOn {
  RunningOn({
    required this.sun,
    required this.mon,
    required this.tue,
    required this.wed,
    required this.thu,
    required this.fri,
    required this.sat,
  });

  final bool sun;
  final bool mon;
  final bool tue;
  final bool wed;
  final bool thu;
  final bool fri;
  final bool sat;

  // CUSTOM CODE
  factory RunningOn.fromJson(Map<String, dynamic> json) => RunningOn(
        sun: json["sun"].toString().toUpperCase() == 'Y',
        mon: json["mon"].toString().toUpperCase() == 'Y',
        tue: json["tue"].toString().toUpperCase() == 'Y',
        wed: json["wed"].toString().toUpperCase() == 'Y',
        thu: json["thu"].toString().toUpperCase() == 'Y',
        fri: json["fri"].toString().toUpperCase() == 'Y',
        sat: json["sat"].toString().toUpperCase() == 'Y',
      );
}
