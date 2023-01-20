import 'package:http/http.dart' as http;

import '../data/train_stoppage_rb_mock.dart';
import '../models/train_stoppage_rb.dart';

Future<RbTrainStoppageResult> fetchMockTrainStoppageFromRB() async {
  return rbTrainStoppageResultFromJson(mockTrainStoppageJson);
}