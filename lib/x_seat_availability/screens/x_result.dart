import 'package:flutter/material.dart';
import 'package:mock_train_project/app/widgets/error_icon_widgets.dart';
import 'package:mock_train_project/x_seat_availability/helper_methods/fetch_seat_availability_mmt.dart';
import 'package:mock_train_project/x_seat_availability/screens/proceed_screen.dart';

import '../models/seat_availability_mmt.dart';

class SeatAvlResultScreen extends StatefulWidget {
  const SeatAvlResultScreen(
      {required this.src,
      required this.dest,
      required this.trainNum,
      required this.travelClass,
      required this.quota,
      required this.doj,
      Key? key})
      : super(key: key);
  final String src, dest, trainNum, travelClass, quota;
  final DateTime doj;

  @override
  State<SeatAvlResultScreen> createState() => _SeatAvlResultScreenState();
}

class _SeatAvlResultScreenState extends State<SeatAvlResultScreen> {
  late Future<MmtSeatAvlResult> _future;

  @override
  void initState() {
    super.initState();
    // _future = fetchSeatAvlFromMmt(
    //   srcCode: widget.src,
    //   destCode: widget.dest,
    //   trainNum: widget.trainNum,
    //   doj: widget.doj,
    //   travelClass: widget.travelClass,
    //   quota: widget.quota,
    // );
    _future= fetchMockSeatAvlFromMmt();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Seats Available")),
        body: FutureBuilder<MmtSeatAvlResult>(
          future: _future,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasData)
                  return Column(
                    children: [
                      ListTile(
                        title: Text(snapshot.data!.trainName),
                        subtitle: Text(widget.trainNum),
                      ),
                      Expanded(
                          child: SeatAvlWidget(
                        snapshot.data!,
                        src: widget.src,
                        dest: widget.dest,
                        trainNo: widget.trainNum,
                        travelClass: widget.travelClass,
                        quota: widget.quota,
                        doj: widget.doj,
                      )),
                    ],
                  );
                else
                  return const ErrorIconWidget();
            }
          },
        ));
  }
}

class SeatAvlWidget extends StatelessWidget {
  const SeatAvlWidget(this.data,
      {required this.src,
      required this.dest,
      required this.trainNo,
      required this.travelClass,
      required this.quota,
      required this.doj,
      Key? key})
      : super(key: key);
  final MmtSeatAvlResult data;
  final String src;
  final String dest;
  final String trainNo;
  final String travelClass;
  final String quota;
  final DateTime doj;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final date = data.avlDayList[index].availablityDate;
        final status = data.avlDayList[index].prettyPrintingAvailablityStatus.toUpperCase();
        final isAvailable = status.contains("AVAILABLE");
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                tileColor: Colors.blue.shade100,
                title: Text(date, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(
                  status,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: isAvailable ? Colors.green : Colors.pink.shade800),
                ),
                trailing: Text("Rs. ${data.totalFare}/-", style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProceedScreen(
                                src: src,
                                dest: dest,
                                doj: doj,
                                boardingFrom: src,
                                boardingUpto: dest,
                                travelClass: travelClass,
                                quota: quota,
                                trainNum: trainNo),
                          ),
                        );
                      },
                      child: const Text("Proceed")),

                ],
              )
            ],
          ),
        );
      },
      itemCount: data.avlDayList.length,
    );
  }
}
