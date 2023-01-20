import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mock_train_project/x_seat_availability/data/seat_availability_mmt_mock.dart';

import '../models/seat_availability_mmt.dart';


Future<MmtSeatAvlResult> fetchMockSeatAvlFromMmt()async{
  return mmtSeatAvlResultFromJson(seatAvlMockJson);
}

