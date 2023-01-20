import 'package:flutter/material.dart';

import 'pnr_result_screen.dart';

class PnrQueryScreen extends StatelessWidget {
  PnrQueryScreen({Key? key}) : super(key: key);
  final TextEditingController _tec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pnr Check"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _tec,
              decoration: const InputDecoration(hintText: "Enter the pnr number"),
              keyboardType: TextInputType.number,
              maxLength: 10,
            ),
          ),
          Text("enter random 10 digit number for mock data".toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_tec.text.isEmpty || _tec.text.trim().length != 10) return;

          Navigator.push(context, MaterialPageRoute(builder: (context) => PnrResultScreen(_tec.text)));
        },
        label: Row(
          children: [Text("Continue"), SizedBox(width: 10), Icon(Icons.double_arrow_rounded)],
        ),
      ),
    );
  }
}
