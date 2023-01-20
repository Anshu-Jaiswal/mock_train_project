// To parse this JSON data, do
//
//     final mmtLiveStationResult = mmtLiveStationResultFromJson(jsonString);

import 'dart:convert';

MmtLiveStationResult mmtLiveStationResultFromJson(String str) =>
    MmtLiveStationResult.fromJson(json.decode(str));

class MmtLiveStationResult {
  MmtLiveStationResult({
    required this.title,
    required this.trains,
  });

  final String title;
  final List<TrainElement> trains;

  factory MmtLiveStationResult.fromJson(Map<String, dynamic> json) =>
      MmtLiveStationResult(
        title: json["Title"],
        trains: List<TrainElement>.from(
            json["Trains"].map((x) => TrainElement.fromJson(x))),
      );
}

class TrainElement {
  TrainElement({
    required this.train,
    required this.arrivalDetails,
    required this.departureDetails,
  });

  final TrainTrain train;
  final ArrivalDetails arrivalDetails;
  final DepartureDetails departureDetails;

  factory TrainElement.fromJson(Map<String, dynamic> json) => TrainElement(
        train: TrainTrain.fromJson(json["Train"]),
        arrivalDetails: ArrivalDetails.fromJson(json["ArrivalDetails"]),
        departureDetails: DepartureDetails.fromJson(json["DepartureDetails"]),
      );
}

class ArrivalDetails {
  ArrivalDetails({
    required this.actualArrivalTime,
    required this.scheduledArrivalTime,
  });

  final String actualArrivalTime;
  final String scheduledArrivalTime;

  factory ArrivalDetails.fromJson(Map<String, dynamic> json) => ArrivalDetails(
        actualArrivalTime: json["actualArrivalTime"],
        scheduledArrivalTime: json["scheduledArrivalTime"],
      );
}

class DepartureDetails {
  DepartureDetails({
    required this.actualDepartureTime,
    required this.scheduledDepartureTime,
  });

  final String actualDepartureTime;
  final String scheduledDepartureTime;

  factory DepartureDetails.fromJson(Map<String, dynamic> json) =>
      DepartureDetails(
        actualDepartureTime: json["actualDepartureTime"],
        scheduledDepartureTime: json["scheduledDepartureTime"],
      );
}

class TrainTrain {
  TrainTrain({
    required this.number,
    required this.name,
  });

  final String number;
  final String name;

  factory TrainTrain.fromJson(Map<String, dynamic> json) => TrainTrain(
        number: json["Number"],
        name: json["Name"],
      );
}
