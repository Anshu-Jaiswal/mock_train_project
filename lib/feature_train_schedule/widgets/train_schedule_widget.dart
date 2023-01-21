import 'package:flutter/material.dart';

import '../models/train_schedule_rb.dart';

class TrainScheduleWidget extends StatelessWidget {
  const TrainScheduleWidget(this._info, {Key? key}) : super(key: key);
  final RbTrainScheduleResult _info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Card(
            color: Colors.indigoAccent,
            child: ListTile(
              title: Text(
                _info.trainName, style: TextStyle (color: Colors.white,)
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${_info.source}(${_info.sourceCode})',style: TextStyle (color: Colors.white, )),
                  const Icon(Icons.arrow_forward_rounded,color: Colors.white,size: 18),
                  Text('${_info.destination}(${_info.destinationCode})',style: TextStyle (color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        runningDaysWidget(_info.daysOfRun),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: _info.schedule.length,
            itemBuilder: (context, index) {
              final schedule = _info.schedule[index];
              return Card(
                color: Colors.grey.shade200,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      schedule.stationCode,
                      style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500),
                    ),
                  ),
                  title: Text(schedule.stationName,style:TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Platform ${schedule.expectedPlatformNo}"),
                      Text("Halt ${schedule.haltMinutes.split(":").first} min"),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  runningDaysWidget(DaysOfRun daysOfRun) {
    return Card(
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text("Running Days ",style: TextStyle(fontWeight: FontWeight.bold)),
            Spacer(), // to add space after row
            RunningDayWidget("M", daysOfRun.mon),
            RunningDayWidget("T", daysOfRun.tue),
            RunningDayWidget("W", daysOfRun.wed),
            RunningDayWidget("T", daysOfRun.thu),
            RunningDayWidget("F", daysOfRun.fri),
            RunningDayWidget("S", daysOfRun.sat),
            RunningDayWidget("S", daysOfRun.sun),
          ],
        ),
      ),
    );
  }
}

class RunningDayWidget extends StatelessWidget {
  const RunningDayWidget(this.dayLetter, this.active, {Key? key})
      : super(key: key);

  final String dayLetter;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
      color: active ? Colors.blue.shade900 : Colors.grey.shade600,
      child: Card(
          margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
          color: active ? Colors.blue.shade400 : Colors.grey.shade400,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
            child: Text(dayLetter,
                style:
                    TextStyle(color: active ? Colors.white : Colors.white60)),
          )),
    );
  }
}
