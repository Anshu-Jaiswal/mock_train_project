// To parse this JSON data, do
//
//     final mmtSeatAvlResult = mmtSeatAvlResultFromJson(jsonString);

import 'dart:convert';

MmtSeatAvlResult mmtSeatAvlResultFromJson(String str) => MmtSeatAvlResult.fromJson(json.decode(str));

class MmtSeatAvlResult {
  MmtSeatAvlResult({
    required this.totalFare,
    required this.trainName,
    required this.avlDayList,
  });

  final int totalFare;
  final String trainName;
  final List<AvlDayList> avlDayList;

  factory MmtSeatAvlResult.fromJson(Map<String, dynamic> json) => MmtSeatAvlResult(
        totalFare: json["totalFare"],
        trainName: json["trainName"],
        avlDayList: List<AvlDayList>.from(json["avlDayList"].map((x) => AvlDayList.fromJson(x))),
      );
}

class AvlDayList {
  AvlDayList({
    required this.availablityDate,
    required this.prettyPrintingAvailablityStatus,
  });

  final String availablityDate;
  final String prettyPrintingAvailablityStatus;

  factory AvlDayList.fromJson(Map<String, dynamic> json) => AvlDayList(
        availablityDate: json["availablityDate"],
        prettyPrintingAvailablityStatus: json["prettyPrintingAvailablityStatus"],
      );
}
