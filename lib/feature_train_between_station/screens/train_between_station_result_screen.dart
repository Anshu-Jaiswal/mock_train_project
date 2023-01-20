import 'package:flutter/material.dart';
import 'package:mock_train_project/app/widgets/error_icon_widgets.dart';
import 'package:mock_train_project/feature_train_between_station/helper_methods/fetch_train_between_station_ptm.dart';
import 'package:mock_train_project/providers/mock_provider.dart';
import 'package:provider/provider.dart';

import '../models/train_btw_station_ptm_custom.dart';
import '../widgets/train_btw_station_widget.dart';

class TrainBtwStationResultScreen extends StatefulWidget {
  const TrainBtwStationResultScreen({required this.srcCode, required this.destCode, required this.date, Key? key})
      : super(key: key);
  final String srcCode, destCode;
  final DateTime date;

  @override
  State<TrainBtwStationResultScreen> createState() => _TrainBtwStationResultScreenState();
}

class _TrainBtwStationResultScreenState extends State<TrainBtwStationResultScreen> {
  late Future<PtmTrainBtwStationResult> _future;

  @override
  void initState() {
    super.initState();
    _future =fetchMockTrainBtwStationFromPtm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Available Trains")),
      body: FutureBuilder<PtmTrainBtwStationResult>(
        future: _future,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasData) {
                return TrainBtwStationWidget(
                  snapshot.data!,
                  widget.date,
                );
              } else {
                return const ErrorIconWidget();
              }
          }
        },
      ),
    );
  }
}
