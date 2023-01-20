import 'package:flutter/material.dart';

import '../models/live_station_mmt.dart';

class LiveStationWidget extends StatelessWidget {
  const LiveStationWidget(this.result, {Key? key}) : super(key: key);
  final MmtLiveStationResult result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 2,
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(result.title, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              final train = result.trains[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(
                    Icons.train_rounded,
                    color: Colors.blue,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(train.train.name), Text(train.train.number)],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Arrives ${train.arrivalDetails.actualArrivalTime}"),
                        Text("Departs ${train.departureDetails.actualDepartureTime}"),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: result.trains.length,
          ),
        )
      ],
    );
  }
}
