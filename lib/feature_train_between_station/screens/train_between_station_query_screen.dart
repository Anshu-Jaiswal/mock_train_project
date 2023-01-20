import 'package:flutter/material.dart';
import 'package:mock_train_project/autocomplete_station/models/station_hint_ptm_custom.dart';
import 'package:mock_train_project/feature_train_between_station/screens/station_picker_screen.dart';
import 'package:intl/intl.dart';

import 'train_between_station_result_screen.dart';

class TrainBtwStationQueryScreen extends StatefulWidget {
  const TrainBtwStationQueryScreen({Key? key}) : super(key: key);

  @override
  State<TrainBtwStationQueryScreen> createState() => _TrainBtwStationQueryScreenState();
}

class _TrainBtwStationQueryScreenState extends State<TrainBtwStationQueryScreen> {
  Station? srcStation, destStation;
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Train Between Stations'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                child: Text(srcStation?.data?.name ?? "Select starting station"),
                onPressed: () async {
                  final value = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StationPickerScreen("Starting Station")),
                  );
                  if (value != null) {
                    setState(() => srcStation = value);
                  }
                },
              ),
              CircleAvatar(
                child: IconButton(
                  icon: Icon(Icons.swap_calls_outlined),
                  onPressed: () {
                    setState(() {
                      final tmp = srcStation;
                      srcStation = destStation;
                      destStation = tmp;
                    });
                  },
                ),
              ),
              ElevatedButton(
                child: Text(destStation?.data?.name ?? "Select ending station"),
                onPressed: () async {
                  final value = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StationPickerScreen("Ending Station")),
                  );
                  if (value != null) {
                    setState(() => destStation = value);
                  }
                },
              ),
              ElevatedButton(
                child: Text(date == null ? "Select date" : DateFormat('dd MMM, yyyy').format(date!).toString()),
                onPressed: () async {
                  final value = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 60)));
                  if (value != null) {
                    setState(() => date = value);
                  }
                },
              ),
              if (srcStation != null && destStation != null && date != null)
                ElevatedButton(
                  child: const Text("Find Trains"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrainBtwStationResultScreen(
                          srcCode: srcStation!.data!.code,
                          destCode: destStation!.data!.code,
                          date: date!,
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
