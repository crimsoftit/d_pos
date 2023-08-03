import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// ignore: must_be_immutable
class TrackAsset extends StatelessWidget {
  String barcode = "Not Scanned";
  TextEditingController bCodeValue = TextEditingController();

  TrackAsset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Color(0xFF18D191))),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        //Navigator.push(
                        //context,
                        //MaterialPageRoute(
                        //builder: (context) => HomePage()));
                        //scanBarcode();

                        try {
                          FlutterBarcodeScanner.scanBarcode(
                                  "#2A99CF", "Cancel", true, ScanMode.QR)
                              .then((value) {
                            barcode = value;
                            bCodeValue.text = barcode;
                          });
                        } catch (e) {
                          barcode = "ERROR! unable to read the barcode!!";
                        }
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: 40.0,
                          decoration: BoxDecoration(
                              color: const Color(0xFF18D191),
                              borderRadius: BorderRadius.circular(9.0)),
                          child: const Text("Scan Barcode",
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white))),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // scanBarcode() async {
  //   try {
  //     FlutterBarcodeScanner.scanBarcode("#2A99CF", "Cancel", true, ScanMode.QR)
  //         .then((value) {
  //       barcode = value;
  //       bCodeValue..text = barcode;
  //     });
  //   } catch (e) {
  //     barcode = "ERROR! unable to read the barcode!!";
  //   }
  // }
}
