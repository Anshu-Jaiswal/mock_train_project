
import '../data/live_station_mmt_mock.dart';
import '../models/live_station_mmt.dart';


Future<MmtLiveStationResult> fetchMockLiveStationFromMmt() async {
  return mmtLiveStationResultFromJson(mockLiveStationJson);
}
