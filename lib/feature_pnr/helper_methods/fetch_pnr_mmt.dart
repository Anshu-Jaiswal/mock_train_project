import 'dart:convert';

import 'package:http/http.dart' as http;

import '../data/pnr_mmt_mock.dart';
import '../models/pnr_mmt_result.dart';

Future<MmtPnrResult> fetchMockPnrFromMmt() async {
  return mmtPnrResultFromJson(mockPnrJson);
}
