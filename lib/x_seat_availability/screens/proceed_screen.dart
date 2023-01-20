import 'package:flutter/material.dart';
import 'package:mock_train_project/pdf_print/test_print.dart';
import 'package:intl/intl.dart';

class ProceedScreen extends StatefulWidget {
  const ProceedScreen(
      {required this.src,
      required this.dest,
      required this.boardingFrom,
      required this.boardingUpto,
      required this.trainNum,
      required this.travelClass,
      required this.quota,
      required this.doj,
      Key? key})
      : super(key: key);

  final String src, dest, boardingFrom, boardingUpto, trainNum, travelClass, quota;
  final DateTime doj;

  @override
  State<ProceedScreen> createState() => _ProceedScreenState();
}

class _ProceedScreenState extends State<ProceedScreen> {
  final List<Traveller> travellers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fill Form")),
      body: Column(
        children: [
          _infoCard("Train Number", widget.trainNum),
          _infoCard("Boarding Station", widget.boardingFrom),
          _infoCard("Travelling To", widget.boardingUpto),
          _infoCard("Station From", widget.src),
          _infoCard("Station Upto", widget.dest),
          _infoCard("Travel Class", widget.travelClass),
          _infoCard("Travel Quota", widget.quota),
          _infoCard("Travel Date", "${DateFormat('dd MMM, yyyy').format(widget.doj)}"),
          Divider(),
          if (travellers.length < 6)
            ElevatedButton(
                onPressed: () async {
                  final traveller = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddTravellerPage(),
                      ));
                  if (traveller != null) {
                    setState(() {
                      travellers.add(traveller);
                    });
                  }
                },
                child: Text("Add Traveller")),
          Expanded(
          child:
          Card(
          color:Colors.grey.shade200,
          margin:EdgeInsets.symmetric(horizontal:16),

                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              final t = travellers[index];
                              return ListTile(
                                title: Text(t.name),
                                leading: CircleAvatar(child: Text("${index + 1}")),
                                subtitle: Text("${t.age} ${t.gender}"),
                                trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      travellers.removeAt(index);
                                    });
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: travellers.length)),
          ),
        ],
      ),
      floatingActionButton: travellers.length < 1
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
                final p = Print(
                    trainNum: widget.trainNum,
                    doj: widget.doj,
                    travelClass: widget.travelClass,
                    seatCount: travellers.length,
                    stationFrom: widget.src,
                    stationTo: widget.dest,
                    boardingFrom: widget.boardingFrom,
                    boardingTo: widget.boardingUpto,
                    travellers: travellers);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => p,
                    ));
              },
              icon: Icon(Icons.print),
              label:Text("Print"),
            ),
    );
  }

  Widget _infoCard(String title, String trailing) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      color: Color.fromARGB(255, 115, 188, 245),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(title), Text(trailing,style:TextStyle(color:Colors.black45)),],
        ),
      ),
    );
  }
}

class AddTravellerPage extends StatefulWidget {
  const AddTravellerPage({Key? key}) : super(key: key);

  @override
  State<AddTravellerPage> createState() => _AddTravellerPageState();
}

class _AddTravellerPageState extends State<AddTravellerPage> {
  int age = 12;
  String name = "";
  String gender = "M";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Passenger Detail"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(hintText: "Enter Passenger name"),
              onChanged: (value) {
                name = value.trim();
              },
            ),
          ),
          Text("Current age :${age}"),
          Slider(
            value: age.toDouble(),
            onChanged: (value) {
              setState(() {
                age = value.toInt();
              });
            },
            min: 12,
            max: 60,
            label: "${age}",
            divisions: 48,
          ),
          Text("Select gender"),
          RadioListTile(
            value: "M",
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value.toString();
              });
            },
            title: Text("Male"),
          ),
          RadioListTile(
            value: "F",
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value.toString();
              });
            },
            title: Text("Female"),
          ),
          RadioListTile(
            value: "O",
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value.toString();
              });
            },
            title: Text("Other"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final t = Traveller(name, age, gender);
          Navigator.pop(context, t);
        },
        icon: Icon(Icons.save),
        label: Text("Save"),
      ),
    );
  }
}
