import 'package:flutter/material.dart';
import 'package:mock_train_project/feature_live_station/screens/live_station_query_screen.dart';
import 'package:mock_train_project/feature_pnr/screens/pnr_query_screen.dart';
import 'package:mock_train_project/feature_train_between_station/screens/train_between_station_query_screen.dart';
import 'package:mock_train_project/providers/mock_provider.dart';
import 'package:provider/provider.dart';

import '../../feature_train_schedule/screens/train_schedule_query_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(title: const Text("Mock Train App")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _trainBtwStationBtn(context),
              _liveStationBtn(context),
              _trainScheduleBtn(context),
              _checkPnrStatusBtn(context),
            ],
          ),
        ),
      ),
      // body: body(),
      drawer: Drawer(
        child: CheckboxListTile(
          title: Text("Use Mock Data"),
          value: context.watch<MockProvider>().mock,
          onChanged: (bool? value) {
            context.read<MockProvider>().toggle();
          },
        ),
      ),
    );
  }

  ElevatedButton _checkPnrStatusBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PnrQueryScreen(),
        ),
      ),
      child: const Text("Check Pnr"),
    );
  }

  ElevatedButton _trainScheduleBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TrainScheduleQueryScreen()),
      ),
      child: const Text("Check Train Schedule"),
    );
  }

  ElevatedButton _liveStationBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LiveStationQueryScreen()),
      ),
      child: const Text("Check Live Station"),
    );
  }

  body() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(12.0),
          child: Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.train),
                backgroundColor: Colors.white,
              ),
              title: Text("Train Tickets", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              trailing: Icon(Icons.arrow_forward_outlined, color: Colors.blue.shade800),
              tileColor: Color.fromARGB(220, 125, 167, 227),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(12),
          child: Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("More Services"),
                Center(
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    childAspectRatio: 2,
                    children: [xCard("PNR"), xCard("Train Schedule"), xCard("Live Station")],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget xCard(String txt) {
    return Card(
      color: Color.fromARGB(150, 94, 148, 166),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.train_outlined,
            ),
          ),
          Text(txt,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
        ],
      ),
    );
  }

  _trainBtwStationBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TrainBtwStationQueryScreen()),
      ),
      child: const Text("Check Train Between station "),
    );
  }
}
