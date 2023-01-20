// To parse this JSON data, do
//
//     final mmtPnrResult = mmtPnrResultFromJson(jsonString);

import 'dart:convert';

MmtPnrResult mmtPnrResultFromJson(String str) =>
    MmtPnrResult.fromJson(json.decode(str));

class MmtPnrResult {
  MmtPnrResult({
    required this.trainDetails,
    required this.stationDetails,
    required this.pnrDetails,
    required this.passengerDetails,
  });

  final TrainDetails trainDetails;
  final StationDetails stationDetails;
  final PnrDetails pnrDetails;
  final PassengerDetails passengerDetails;

  factory MmtPnrResult.fromJson(Map<String, dynamic> json) =>
      MmtPnrResult(
        trainDetails: TrainDetails.fromJson(json["TrainDetails"]),
        stationDetails: StationDetails.fromJson(json["StationDetails"]),
        pnrDetails: PnrDetails.fromJson(json["PnrDetails"]),
        passengerDetails: PassengerDetails.fromJson(json["PassengerDetails"]),
      );
}

class PassengerDetails {
  PassengerDetails({
    required this.passengerStatus,
  });

  final List<PassengerStatus> passengerStatus;

  factory PassengerDetails.fromJson(Map<String, dynamic> json) =>
      PassengerDetails(
        passengerStatus: List<PassengerStatus>.from(
            json["PassengerStatus"].map((x) => PassengerStatus.fromJson(x))),
      );
}

class PassengerStatus {
  PassengerStatus({
    required this.bookingBerthNo,
    required this.bookingCoachId,
    required this.bookingStatusNew,
    required this.currentBerthNo,
    required this.currentCoachId,
    required this.currentStatusNew,
    required this.currentStatus,
  });

  final String bookingBerthNo;
  final String bookingCoachId;
  final String bookingStatusNew;
  final String currentBerthNo;
  final String currentCoachId;
  final String currentStatusNew;
  final String currentStatus;

  factory PassengerStatus.fromJson(Map<String, dynamic> json) =>
      PassengerStatus(
          bookingBerthNo: json["BookingBerthNo"],
          bookingCoachId: json["BookingCoachId"],
          bookingStatusNew: json["BookingStatusNew"],
          currentBerthNo: json["CurrentBerthNo"],
          currentCoachId: json["CurrentCoachId"],
          currentStatusNew: json["CurrentStatusNew"],
          currentStatus: json["CurrentStatus"]
      );
}

class PnrDetails {
  PnrDetails({
    required this.pnr,
    required this.sourceDoj,
    required this.quota,
    required this.travelClass,
  });

  final String pnr;
  final SourceDoj sourceDoj;
  final String quota;
  final String travelClass;

  factory PnrDetails.fromJson(Map<String, dynamic> json) =>
      PnrDetails(
        pnr: json["Pnr"],
        sourceDoj: SourceDoj.fromJson(json["SourceDoj"]),
        quota: json["Quota"],
        travelClass: json["Class"],

      );
}

class SourceDoj {
  SourceDoj({
    required this.formattedDate,
  });

  final String formattedDate;

  factory SourceDoj.fromJson(Map<String, dynamic> json) =>
      SourceDoj(formattedDate: json["FormattedDate"]);
}

class StationDetails {
  StationDetails({
    required this.boardingPoint,
    required this.reservationUpto,
  });

  final BoardingPoint boardingPoint;
  final BoardingPoint reservationUpto;

  factory StationDetails.fromJson(Map<String, dynamic> json) =>
      StationDetails(
        boardingPoint: BoardingPoint.fromJson(json["BoardingPoint"]),
        reservationUpto: BoardingPoint.fromJson(json["ReservationUpto"]),
      );
}

class BoardingPoint {
  BoardingPoint({
    required this.name,
    required this.code,
  });

  final String name;
  final String code;

  factory BoardingPoint.fromJson(Map<String, dynamic> json) =>
      BoardingPoint(
        name: json["name"],
        code: json["code"],
      );
}

class TrainDetails {
  TrainDetails({
    required this.train,
    required this.chartPrepared,
  });

  final Train train;
  final bool chartPrepared;

  factory TrainDetails.fromJson(Map<String, dynamic> json) =>
      TrainDetails(
        train: Train.fromJson(json["Train"]),
        chartPrepared: json["ChartPrepared"],
      );
}

class Train {
  Train({
    required this.number,
    required this.name,
  });

  final String number;
  final String name;

  factory Train.fromJson(Map<String, dynamic> json) =>
      Train(
        number: json["Number"],
        name: json["Name"],
      );
}
