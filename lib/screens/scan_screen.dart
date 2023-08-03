import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// ignore: must_be_immutable
class ScanScreen extends StatelessWidget {
  String qrString = "not scanned";
  late double width, height;

  ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan barcode"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            qrString,
            style: const TextStyle(color: Colors.orange, fontSize: 24),
          ),
          ElevatedButton(
            onPressed: scanBarcode(),
            child: const Text("Scan barcode"),
          ),
        ],
      ),
    );
  }

  scanBarcode() async {
    try {
      FlutterBarcodeScanner.scanBarcode(
              "#2A99CF", "cancel", true, ScanMode.BARCODE)
          .then((value) {
        qrString = value;
      });
    } catch (er) {
      qrString = "unable to scan qr";
    }
  }
}
