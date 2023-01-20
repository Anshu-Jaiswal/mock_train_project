// To parse this JSON data, do
//
//     final rbTrainHintResult = rbTrainHintResultFromJson(jsonString);

import 'dart:convert';

RbTrainHintResult rbTrainHintResultFromJson(String str) => RbTrainHintResult.fromJson(json.decode(str));

class RbTrainHintResult {
  RbTrainHintResult({
    required this.response,
  });

  final Response response;

  factory RbTrainHintResult.fromJson(Map<String, dynamic> json) => RbTrainHintResult(
        response: Response.fromJson(json["response"]),
      );
}

class Response {
  Response({
    required this.docs,
  });

  final List<Doc> docs;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
      );
}

class Doc {
  Doc({
    required this.trainNo,
    required this.trainName,
  });

  final String trainNo;
  final String trainName;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        trainNo: json["trainNo"],
        trainName: json["trainName"],
      );
}
