// To parse this JSON data, do
//
//     final rbTrainScheduleResult = rbTrainScheduleResultFromJson(jsonString);

import 'dart:convert';

RbTrainScheduleResult rbTrainScheduleResultFromJson(String str) => RbTrainScheduleResult.fromJson(json.decode(str));

class RbTrainScheduleResult {
  RbTrainScheduleResult({
    required this.trainName,
    required this.trainNo,
    required this.trainNumberString,
    required this.trainType,
    required this.source,
    required this.destination,
    required this.sourceCode,
    required this.destinationCode,
    required this.daysOfRun,
    required this.classes,
    required this.schedule,
    required this.totalDuration,
    required this.totalDistance,
    required this.totalNumberOfStops,
  });

  final String trainName;
  final int trainNo;
  final String trainNumberString;
  final String trainType;
  final String source;
  final String destination;
  final String sourceCode;
  final String destinationCode;
  final DaysOfRun daysOfRun;
  final List<String> classes;
  final List<Schedule> schedule;
  final int totalDuration;
  final String totalDistance;
  final String totalNumberOfStops;

  factory RbTrainScheduleResult.fromJson(Map<String, dynamic> json) => RbTrainScheduleResult(
        trainName: json["TrainName"],
        trainNo: json["TrainNo"],
        trainNumberString: json["TrainNumberString"],
        trainType: json["TrainType"],
        source: json["Source"],
        destination: json["Destination"],
        sourceCode: json["SourceCode"],
        destinationCode: json["DestinationCode"],
        daysOfRun: DaysOfRun.fromJson(json["DaysOfRun"]),
        classes: List<String>.from(json["Classes"].map((x) => x)),
        schedule: List<Schedule>.from(json["Schedule"].map((x) => Schedule.fromJson(x))),
        totalDuration: json["TotalDuration"],
        totalDistance: json["TotalDistance"],
        totalNumberOfStops: json["TotalNumberOfStops"],
      );
}

class DaysOfRun {
  DaysOfRun({
    required this.mon,
    required this.tue,
    required this.wed,
    required this.thu,
    required this.fri,
    required this.sat,
    required this.sun,
  });

  final bool mon;
  final bool tue;
  final bool wed;
  final bool thu;
  final bool fri;
  final bool sat;
  final bool sun;

  factory DaysOfRun.fromJson(Map<String, dynamic> json) => DaysOfRun(
        mon: json["Mon"],
        tue: json["Tue"],
        wed: json["Wed"],
        thu: json["Thu"],
        fri: json["Fri"],
        sat: json["Sat"],
        sun: json["Sun"],
      );
}

class Schedule {
  Schedule({
    required this.stationName,
    required this.stationCode,
    required this.stopNumber,
    required this.arrivalTime,
    required this.departureTime,
    required this.haltMinutes,
    required this.day,
    required this.distanceFromOrigin,
    required this.expectedPlatformNo,
  });

  final String stationName;
  final String stationCode;
  final int stopNumber;
  final String arrivalTime;
  final String departureTime;
  final String haltMinutes;
  final int day;
  final String distanceFromOrigin;
  final String expectedPlatformNo;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        stationName: json["StationName"],
        stationCode: json["StationCode"],
        stopNumber: json["StopNumber"],
        arrivalTime: json["ArrivalTime"],
        departureTime: json["DepartureTime"],
        haltMinutes: json["HaltMinutes"],
        day: json["Day"],
        distanceFromOrigin: json["DistanceFromOrigin"],
        expectedPlatformNo: json["ExpectedPlatformNo"],
      );
}
