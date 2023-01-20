import 'package:mock_train_project/feature_train_schedule/data/train_schedule_rb_mock.dart';
import 'package:http/http.dart' as http;

import '../models/train_schedule_rb.dart';

Future<RbTrainScheduleResult> fetchMockTrainScheduleFromRB() async {
  return rbTrainScheduleResultFromJson(mockTrainScheduleJson);
}
