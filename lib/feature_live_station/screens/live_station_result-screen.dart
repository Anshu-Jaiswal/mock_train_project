import 'package:flutter/material.dart';
import 'package:mock_train_project/app/widgets/error_icon_widgets.dart';
import 'package:mock_train_project/feature_live_station/models/live_station_mmt.dart';
import 'package:mock_train_project/providers/mock_provider.dart';
import 'package:provider/provider.dart';

import '../helper_methods/live_station_mmt.dart';
import '../widgets/live_station_widget.dart';

class LiveStationResultScreen extends StatefulWidget {
  // srcCode is compulsory & dstCode is optional by default it is empty
  const LiveStationResultScreen(this.srcCode, {this.dstCode = "", Key? key}) : super(key: key);
  final String srcCode, dstCode;

  @override
  State<LiveStationResultScreen> createState() => _LiveStationResultScreenState();
}

class _LiveStationResultScreenState extends State<LiveStationResultScreen> {
  late Future<MmtLiveStationResult> _future;

  @override
  void initState() {
    super.initState();
    _future =fetchMockLiveStationFromMmt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Available trains"),),
      body: FutureBuilder<MmtLiveStationResult>(
        future: _future,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return CircularProgressIndicator();
            case ConnectionState.done:
              if (snapshot.hasData) {
                return LiveStationWidget(snapshot.data!);
              } else {
                return ErrorIconWidget();
              }
          }
        },
      ),
    );
  }
}
