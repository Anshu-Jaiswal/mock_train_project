import 'package:flutter/material.dart';
import 'package:mock_train_project/autocomplete_station/helper_methods/fetch_station_hint_ptm.dart';
import 'package:mock_train_project/autocomplete_station/models/station_hint_ptm_custom.dart';
import 'package:mock_train_project/providers/mock_provider.dart';
import 'package:provider/provider.dart';

class LiveStationInputScreen extends StatefulWidget {
  const LiveStationInputScreen(this.label, {Key? key}) : super(key: key);
  final String label;

  @override
  State<LiveStationInputScreen> createState() => _LiveStationInputScreenState();
}

class _LiveStationInputScreenState extends State<LiveStationInputScreen> {
  final List<Station> stationList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.label)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                if (value.isEmpty) {
                  setState(() => stationList.clear());
                } else if (value.length >= 3) updateAutoCompleteHintList(value);
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  final station = stationList[index];
                  return ListTile(
                    title: Text(station.data!.name),
                    // data! represent data in not null with guaranty
                    subtitle: Text(station.data!.displayLocation),
                    trailing: Text(station.data!.code),
                    onTap: () => Navigator.pop(context, station),
                  );
                },
                separatorBuilder: (_, __) => Divider(),
                itemCount: stationList.length),
          )
        ],
      ),
    );
  }

  Future<void> updateAutoCompleteHintList(String query) async {
    stationList.clear();

    final data = filteredStationHint(
        await fetchMockStationHintFromPtm()); // to access actual data from net use this line
    stationList.addAll(data);
    setState(() {}); // to redraw the list on screen
  }
}
