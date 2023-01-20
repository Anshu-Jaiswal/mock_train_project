import 'package:flutter/material.dart';
import 'package:mock_train_project/app/widgets/error_icon_widgets.dart';
import 'package:mock_train_project/providers/mock_provider.dart';
import 'package:provider/provider.dart';

import '../helper_methods/fetch_pnr_mmt.dart';
import '../models/pnr_mmt_result.dart';
import '../widgets/pnr_widget.dart';

class PnrResultScreen extends StatefulWidget {
  const PnrResultScreen(this.pnr, {Key? key}) : super(key: key);
  final String pnr;

  @override
  State<PnrResultScreen> createState() => _PnrResultScreenState();
}

class _PnrResultScreenState extends State<PnrResultScreen> {
  late Future<MmtPnrResult> _future;

  @override
  void initState() {
    super.initState();
    _future =fetchMockPnrFromMmt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PNR Status"),
      ),
      body: FutureBuilder<MmtPnrResult>(
        future: _future,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());

            case ConnectionState.done:
              if (snapshot.hasData) {
                return PnrWidget(snapshot.data!);
              } else {
                return ErrorIconWidget();
              }
          }
        },
      ),
    );
  }
}
