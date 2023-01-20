import 'package:flutter/material.dart';

import '../models/pnr_mmt_result.dart';

class PnrWidget extends StatelessWidget {
  const PnrWidget(this.pnrData, {Key? key}) : super(key: key);
  final MmtPnrResult pnrData;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        pnrBody(context),
        SizedBox(height: 12),
        seatBody(context),
      ],
    );
    return ListView(
      children: [
        ListTile(
          title: Text(pnrData.pnrDetails.pnr),
          subtitle: const Text('PNR Number'),
        ),
        ListTile(
          title: Text(pnrData.pnrDetails.sourceDoj.formattedDate),
          subtitle: const Text('Date Of Journey'),
        ),
        ListTile(
          title: Text(pnrData.trainDetails.train.name),
          trailing: Text(pnrData.trainDetails.train.number),
        ),
        ListTile(
          title: Text(pnrData.stationDetails.boardingPoint.name),
          trailing: Text(pnrData.stationDetails.boardingPoint.code),
          subtitle: const Text("Boarding Station"),
        ),
        ListTile(
          title: Text(pnrData.stationDetails.reservationUpto.name),
          trailing: Text(pnrData.stationDetails.reservationUpto.code),
          subtitle: const Text("Reserved Upto"),
        ),
        const ListTile(
          title: Text("Passenger Info"),
        ),
        for (int i = 0; i < pnrData.passengerDetails.passengerStatus.length; i++)
          passengerInfoWidget(i + 1, pnrData.passengerDetails.passengerStatus[i])
      ],
    );
  }

  Widget passengerInfoWidget(int position, PassengerStatus status) {
    return ListTile(
      title: Text('${status.currentCoachId}, ${status.currentBerthNo}'),
      leading: CircleAvatar(child: Text('$position')),
      trailing: Text(status.currentStatusNew),
    );
  }

  Widget pnrBody(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          ListTile(
            tileColor: Colors.blue,
            textColor: Colors.white,
            leading: const CircleAvatar(child: Icon(Icons.train_rounded), backgroundColor: Colors.white),
            title: Text("PNR : ${pnrData.pnrDetails.pnr}",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.headline5?.fontSize)),
            subtitle: const Text("Booked on : "),
          ),
          const SizedBox(
            height: 8,
          ),
          _infoRow(
              context, "Train Name & No.", "${pnrData.trainDetails.train.name} - ${pnrData.trainDetails.train.number}"),
          _infoRow(context, "Journey Date & Time ", "${pnrData.pnrDetails.sourceDoj.formattedDate} "),
          _infoRow(context, "Number Of Passenger ", "${pnrData.passengerDetails.passengerStatus.length}"),
          _infoRow(context, "Boarding From ",
              "${pnrData.stationDetails.boardingPoint.name} - ${pnrData.stationDetails.boardingPoint.code}"),
          _infoRow(context, "Reservation Upto ",
              "${pnrData.stationDetails.reservationUpto.name} - ${pnrData.stationDetails.reservationUpto.code}"),
          _infoRow(context, "Quota : ", "${pnrData.pnrDetails.quota}"),
        ],
      ),
    );
  }

  Widget seatBody(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          ListTile(
            tileColor: Colors.blue,
            textColor: Colors.white,
            leading: const CircleAvatar(
              child: Icon(Icons.event_seat_sharp),
              backgroundColor: Colors.white,
            ),
            title: Text("Seat Status",
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: Theme.of(context).textTheme.headline5?.fontSize)),
            subtitle: Text("${pnrData.passengerDetails.passengerStatus.length} Passenger"),
          ),
          _infoRow(context, "Journey Class ", pnrData.pnrDetails.travelClass),
          _infoRow(
              context, "Chart Status ", pnrData.trainDetails.chartPrepared ? "Chart Prepared" : "Chart Not Prepared"),
          Container(
            color: Colors.blueGrey.shade100,
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Current Status", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Confirmation", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          for (int i = 0; i < pnrData.passengerDetails.passengerStatus.length; i++)
            _infoRow(context, pnrData.passengerDetails.passengerStatus[i].currentStatus,
                pnrData.passengerDetails.passengerStatus[i].currentStatusNew)
        ],
      ),
    );
  }

  _infoRow(BuildContext context, String leadingText, String trailingText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(leadingText, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(trailingText, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.black12,
          )
        ],
      ),
    );
  }
}
