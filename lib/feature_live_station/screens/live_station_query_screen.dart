import 'package:flutter/material.dart';
import 'package:mock_train_project/autocomplete_station/models/station_hint_ptm_custom.dart';
import 'package:mock_train_project/feature_live_station/screens/live_station_result-screen.dart';

import 'live_station_input_screen.dart';

class LiveStationQueryScreen extends StatefulWidget {
  const LiveStationQueryScreen({Key? key}) : super(key: key);

  @override
  State<LiveStationQueryScreen> createState() => _LiveStationQueryScreenState();
}

class _LiveStationQueryScreenState extends State<LiveStationQueryScreen> {
  Station? srcStation, dstStation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Live Station"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () async {
                final value = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LiveStationInputScreen("Select starting station"),
                    ));
                print(value);
                if (value != null) {
                  setState(() {
                    // to redraw the screen
                    srcStation = value;
                  });
                }
              },
              child: Text(srcStation?.data?.name ?? "From Station"), // ????
            ),
            ElevatedButton(
                onPressed: () async {
                  final value = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LiveStationInputScreen(
                            "Select Destination Station"),
                      ));
                  if (value != null) {
                    setState(() {
                      dstStation = value;
                    });
                  }
                },
                child: Text(dstStation?.data?.name ?? "To Station")),
            if (srcStation != null)
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LiveStationResultScreen(
                            srcStation!.data!.code,
                            // ! data cannot be null ,? means data can de null
                            dstCode: dstStation?.data?.code ?? "",
                          ),
                        ));
                  },
                  child: Text("Continue"))
          ],
        ),
      ),
    );
  }
}
