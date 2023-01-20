import 'package:flutter/material.dart';
import 'package:mock_train_project/app/widgets/error_icon_widgets.dart';
import 'package:mock_train_project/feature_train_schedule/helper_methods/fetch_train_schedule_rb.dart';
import 'package:mock_train_project/feature_train_schedule/models/train_schedule_rb.dart';
import 'package:mock_train_project/providers/mock_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/train_schedule_widget.dart';

class TrainScheduleResultScreen extends StatefulWidget {
  const TrainScheduleResultScreen(this._trainNumber, {Key? key}) : super(key: key);
  final String _trainNumber;

  @override
  State<TrainScheduleResultScreen> createState() => _TrainScheduleResultScreen();
}

class _TrainScheduleResultScreen extends State<TrainScheduleResultScreen> {
  late Future<RbTrainScheduleResult> _future;

  @override
  void initState() {
    super.initState();
    _future = fetchMockTrainScheduleFromRB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._trainNumber),
      ),
      body: FutureBuilder<RbTrainScheduleResult>(
        future: _future,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasData) {
                return TrainScheduleWidget(snapshot.data!);
              } else {
                return ErrorIconWidget();
              }
          }
        },
      ),
    );
  }
}
