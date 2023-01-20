import 'package:flutter/material.dart';
import 'package:mock_train_project/feature_train_between_station/models/train_btw_station_ptm_custom.dart';

class TravelDaysDisplayWidget extends StatelessWidget {
  const TravelDaysDisplayWidget(this._runningOn, {Key? key}) : super(key: key);
  final RunningOn _runningOn;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // for (var d in _days.entries) _TravelDayWidget(d.key, d.value),
        _TravelDayWidget("Mon", _runningOn.mon),
        _TravelDayWidget("Tue", _runningOn.tue),
        _TravelDayWidget("Wed", _runningOn.wed),
        _TravelDayWidget("Thu", _runningOn.thu),
        _TravelDayWidget("Fri", _runningOn.fri),
        _TravelDayWidget("Sat", _runningOn.sat),
        _TravelDayWidget("Sun", _runningOn.sun),
      ],
    );
  }
}

class _TravelDayWidget extends StatelessWidget {
  const _TravelDayWidget(this.label, this.active, {Key? key}) : super(key: key);
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: active ? Colors.blue.shade900 : Colors.grey.shade900,
      margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
      child: Card(
        color: active ? Colors.blue.shade400 : Colors.grey.shade200,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: Text(
            label[0],
            style: TextStyle(color: active ? Colors.white : Colors.grey.shade500),
          ),
        ),
      ),
    );
  }
}
