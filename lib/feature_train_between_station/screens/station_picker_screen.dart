import 'package:flutter/material.dart';
import 'package:mock_train_project/autocomplete_station/helper_methods/fetch_station_hint_ptm.dart';
import 'package:mock_train_project/autocomplete_station/models/station_hint_ptm_custom.dart';
import 'package:mock_train_project/providers/mock_provider.dart';
import 'package:provider/provider.dart';

class StationPickerScreen extends StatefulWidget {
  const StationPickerScreen(this.label, {Key? key}) : super(key: key);
  final String label;

  @override
  State<StationPickerScreen> createState() => _StationPickerScreenState();
}

class _StationPickerScreenState extends State<StationPickerScreen> {
  final List<Station> stationList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.label)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(hintText: "Search Station by Name or Code"),
              onChanged: (value) {
                if (value.isEmpty || value
                    .trim()
                    .length < 3) {
                  setState(() {
                    stationList.clear();
                  }
                  );
                }
                else {
                  updateAutoCompleteHintList(value.trim()).then((value) =>
                      setState(() {

                      },));
                }
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  final station = stationList[index];
                  return ListTile(
                    title: Text(station.data!.name),
                    onTap: () => Navigator.pop(context, station),
                    subtitle: Text(station.data!.displayLocation),
                    trailing: Text(station.data!.code),
                  );
                },
                separatorBuilder: (context, index) => Divider(color: Colors.black),
                itemCount: stationList.length),
          )
        ],
      ),
    );
  }

  Future<void> updateAutoCompleteHintList(String query) async {
    stationList.clear();
    final hint = fetchMockStationHintFromPtm() ;
    final data = filteredStationHint(await hint);
    stationList.addAll(data);
  }
}
