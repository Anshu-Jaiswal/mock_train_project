import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfx/pdfx.dart' as pdfx;


class Print extends StatefulWidget {
  Print(
      {required this.trainNum,
      required DateTime doj,
      required this.travelClass,
      required this.seatCount,
      required this.stationFrom,
      required this.stationTo,
      required this.boardingFrom,
      required this.boardingTo,
      required this.travellers,
      Key? key})
      : this.dojStr = DateFormat('dd - MMM - yyyy').format(doj);

  final String trainNum;
  final String dojStr;
  final String travelClass;
  final int seatCount;
  final String stationFrom;
  final String stationTo;
  final String boardingFrom;
  final String boardingTo;
  final List<Traveller> travellers;

  @override
  State<Print> createState() => _PrintState();
}

class _PrintState extends State<Print> {
  @override
  void initState() {
    super.initState();
    printPdf().then((path) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PinchPage(path),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  Future<String> printPdf() async {
/*    const trainNum = '12181';
    const trainName = 'DAYODAI EXPRESS';
    final DateTime doj = DateTime(2023, 1, 20);
    final dojStr = DateFormat('dd - MMM - yyyy').format(doj);
    const travelClass = "SL";
      final seatCount = 1;
    final stationFrom = "DMO";
    final stationTo = "KOTA";
    final boardingFrom = "SGO";
    final boardingTo = "KOTA";*/

    final tcMap = {"SL": "Sleeper", "2S": "2nd Seater"};
    final pdf = pw.Document();

    var page = pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
              child: pw.Column(children: [
            pw.Text("RESERVATION / CANCELLATION REQUISITION FORM", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            x_row("Train No & Name ", "${widget.trainNum}", "Date of Journey ", widget.dojStr),
            x_row("Class ", "${widget.travelClass} / ${tcMap[widget.travelClass]}", "No. of seats/berth ",
                widget.seatCount.toString()),
            x_row("Station From ", widget.stationFrom, "Station To ", widget.stationTo),
            x_row("Boarding At ", widget.boardingFrom, "Reservation Upto ", widget.boardingTo),
            x_table(),
          ]));
        });

    pdf.addPage(page); // Page

    final ds = await getTemporaryDirectory();
    final file = File("${ds.path}/example.pdf");
    print(file.toString());
    await file.writeAsBytes(await pdf.save());
    print('done pdf printing');
    return file.path;
  }

  pw.Text normalText(String s) => pw.Text(s);

  pw.Text underlineText(String s) => pw.Text(s, style: const pw.TextStyle(decoration: pw.TextDecoration.underline));

  pw.Row x_row(String s1, String s2, String s3, String s4) {
    return pw.Row(children: [normalText(s1), underlineText(s2), pw.Spacer(), normalText(s3), underlineText(s4)]);
  }

  x_table() {
    final tvs = widget.travellers;

    return pw.Table(
        border: const pw.TableBorder(
          bottom: pw.BorderSide(color: PdfColors.black),
          left: pw.BorderSide(color: PdfColors.black),
          right: pw.BorderSide(color: PdfColors.black),
          top: pw.BorderSide(color: PdfColors.black),
          horizontalInside: pw.BorderSide(color: PdfColors.black),
          verticalInside: pw.BorderSide(color: PdfColors.black),
        ),
        children: [
          pw.TableRow(
            children: [
              pw.Text(" S.No.", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text(" Name on Block Letter", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text(" Gender", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text(" Age", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text(" Concession", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text(" Choice", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ],
          ),
          for (int i = 0; i < tvs.length; i++)
            pw.TableRow(
              children: [
                pw.Text("${i + 1}", textAlign: pw.TextAlign.center),
                pw.Text(tvs[i].name, textAlign: pw.TextAlign.center),
                pw.Text(tvs[i].gender, textAlign: pw.TextAlign.center),
                pw.Text("${tvs[i].age}", textAlign: pw.TextAlign.center),
                pw.Text(" "),
                pw.Text(" "),
              ],
            ),
        ]);
  }
}

class Traveller {
  final String name;
  final int age;
  final String gender;

  Traveller(this.name, this.age, this.gender);
}

class PinchPage extends StatefulWidget {
  final String path;

  const PinchPage(this.path, {Key? key}) : super(key: key);

  @override
  State<PinchPage> createState() => _PinchPageState();
}

class _PinchPageState extends State<PinchPage> {
  late pdfx.PdfControllerPinch _pdfControllerPinch;

  @override
  void initState() {
    super.initState();
    _pdfControllerPinch = pdfx.PdfControllerPinch(document: pdfx.PdfDocument.openFile(widget.path), initialPage: 1);
  }

  @override
  void dispose() {
    _pdfControllerPinch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text('Reservation Form')),
      body: pdfx.PdfViewPinch(
        controller: _pdfControllerPinch,
        builders: pdfx.PdfViewPinchBuilders<pdfx.DefaultBuilderOptions>(
          options: const pdfx.DefaultBuilderOptions(),
          documentLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
          pageLoaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
          errorBuilder: (_, error) => Center(child: Text(error.toString())),
        ),
      ),
    );
  }
}
