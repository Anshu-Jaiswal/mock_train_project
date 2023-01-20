import 'package:flutter/material.dart';
import 'package:mock_train_project/autocomplete_train/helper_methods/fetch_train_hint_rb.dart';
import 'package:mock_train_project/autocomplete_train/models/train_hint_rb.dart';
import 'package:mock_train_project/providers/mock_provider.dart';
import 'package:provider/provider.dart';

import 'train_schedule_result_screen.dart';

class TrainScheduleQueryScreen extends StatefulWidget {
  const TrainScheduleQueryScreen({Key? key}) : super(key: key);

  @override
  State<TrainScheduleQueryScreen> createState() =>
      _TrainScheduleQueryScreenState();
}

class _TrainScheduleQueryScreenState extends State<TrainScheduleQueryScreen> {
  final List<Doc> trainList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                if (value.isEmpty || value.trim().length < 3) return;
                updateAutoCompleteHintList(value.trim())
                    .then((value) => setState(() {}));
              },
              decoration: const InputDecoration(
                  hintText: "Search Train by Name or number"),
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (_, __) => const Divider(color: Colors.black),
              itemCount: trainList.length,
              itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.directions_train_sharp),
                title: Text(trainList[index].trainName),
                trailing: Text(trainList[index].trainNo),
                onTap: () {
                  print(
                      '_TrainScheduleQueryScreenState.build() tapped on ${trainList[index].trainNo}');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TrainScheduleResultScreen(trainList[index].trainNo),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> updateAutoCompleteHintList(String query) async {
    trainList.clear();
    final data = await fetchMockTrainHintFromRB();
    trainList.addAll(data.response.docs);
  }
}
