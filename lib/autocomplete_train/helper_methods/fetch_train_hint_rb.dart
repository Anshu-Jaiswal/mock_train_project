import 'package:mock_train_project/autocomplete_train/data/train_hint_rb_mock.dart';

import '../models/train_hint_rb.dart';

Future<RbTrainHintResult> fetchMockTrainHintFromRB() async {
  return rbTrainHintResultFromJson(mockTrainHintJson);
}
