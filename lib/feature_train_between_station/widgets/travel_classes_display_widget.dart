import 'package:flutter/material.dart';

class TravelClassesDisplayWidget extends StatelessWidget {
  const TravelClassesDisplayWidget(this._classes, {Key? key}) : super(key: key);
  final List<String> _classes;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var c in _classes) _TravelClassWidget(c),
      ],
    );
  }
}

class _TravelClassWidget extends StatelessWidget {
  const _TravelClassWidget(this.label, {Key? key}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade900,
      margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
      child: Card(
        color: Colors.blue.shade400,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          child: Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
