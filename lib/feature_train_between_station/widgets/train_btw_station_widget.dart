import 'package:flutter/material.dart';
import 'package:mock_train_project/feature_train_between_station/models/train_btw_station_ptm_custom.dart';
import 'package:mock_train_project/feature_train_between_station/widgets/travel_days_display_widget.dart';
import 'package:mock_train_project/feature_train_schedule/screens/train_schedule_result_screen.dart';
import 'package:mock_train_project/x_seat_availability/screens/x_result.dart';
import 'package:intl/intl.dart';

import 'travel_classes_display_widget.dart';

class TrainBtwStationWidget extends StatelessWidget {
  const TrainBtwStationWidget(this.data, this.doj, {Key? key}) : super(key: key);
  final PtmTrainBtwStationResult data;
  final DateTime doj;

  @override
  Widget build(BuildContext context) {
    final trains = data.body.trains;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ListView.builder(
        itemCount: trains.length,
        itemBuilder: (context, index) {
          final train = trains[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Card(
              color: Color.fromARGB(255, 250, 205, 246),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  ListTile(
                    title: Text(train.trainFullName),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text(train.trainNumber), TravelClassesDisplayWidget(train.classes)],
                    ),
                  ),
                  _stationInfo(train),
                  _timingInfo(train),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MidScreen(
                                      srcCode: train.source,
                                      destCode: train.destination,
                                      doj: doj,
                                      train: train,
                                      trainNumber: train.trainNumber),
                                ));
                          },
                          child: Text("Select train")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TrainScheduleResultScreen(train.trainNumber),
                                ));
                          },
                          child: Text("Check Schedule")),
                    ],
                  ),
                  Divider(color: Colors.blue, thickness: 2, indent: 50, endIndent: 50)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Text _durationWidget(String s) {
    final parts = s.split(":").map((e) => int.parse(e)).toList();
    return Text("${parts[0]} h ${parts[1]} m");
  }

  Widget _stationInfo(Train train) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(train.sourceName),
                Text(train.source, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          TravelDaysDisplayWidget(train.runningOn),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  train.destinationName,
                  textAlign: TextAlign.end,
                ),
                Text(train.destination, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _redBar() {
    return Container(
      height: 2,
      width: 20,
      color: Colors.red,
    );
  }

  Widget _timingInfo(Train train) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Arrival"),
                Text(DateFormat.jm().format(train.arrival)),
              ],
            ),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _redBar(),
              _durationWidget(train.duration),
              _redBar(),
            ],
          )),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Departure"),
                Text(DateFormat.jm().format(train.departure)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MidScreen extends StatefulWidget {
  const MidScreen(
      {required this.srcCode,
      required this.destCode,
      required this.trainNumber,
      required this.doj,
      required this.train,
      Key? key})
      : super(key: key);
  final String srcCode, destCode, trainNumber;
  final DateTime doj;
  final Train train;

  @override
  State<MidScreen> createState() => _MidScreenState();
}

class _MidScreenState extends State<MidScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Coach Type")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.blue.shade200,
                    child: ListTile(
                      title: Text(widget.train.classes[index]),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SeatAvlResultScreen(
                                src: widget.srcCode,
                                dest: widget.destCode,
                                doj: widget.doj,
                                quota: "GN",
                                trainNum: widget.trainNumber,
                                travelClass: widget.train.classes[index],
                              ),
                            ));
                      },
                    ),
                  );
                },
                itemCount: widget.train.classes.length),
          ),
        ],
      ),
    );
  }
}
