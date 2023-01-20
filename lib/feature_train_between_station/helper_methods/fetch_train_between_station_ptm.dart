import 'package:mock_train_project/feature_train_between_station/data/train_between_station_ptm_mock.dart';

import '../models/train_btw_station_ptm_custom.dart';

Future<PtmTrainBtwStationResult> fetchMockTrainBtwStationFromPtm() async {
  return ptmTrainBtwStationResultFromJson(mockTrainBtwStationjson);
}
