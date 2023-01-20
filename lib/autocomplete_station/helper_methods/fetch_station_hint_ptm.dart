import 'package:mock_train_project/autocomplete_station/data/station_hint_ptm_mock.dart';
import "package:http/http.dart" as http;

import '../models/station_hint_ptm_custom.dart';

Future<PtmStationHintResult> fetchMockStationHintFromPtm() async {
  return ptmStationHintResultFromJson(mockStationHintJson);
}

List<Station> filteredStationHint(PtmStationHintResult result) {
  return result.body.first.stations
      .where((station) => station.data != null) // where ||filter
      .toList();
}
