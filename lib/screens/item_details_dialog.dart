import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//import 'package:sqflite/sqflite.dart';
import 'package:d_pos/models/stock_model.dart';
import 'package:d_pos/db/stock_db.dart';
import 'package:intl/intl.dart';
//import 'package:intl/intl.dart' as intl;

class ItemDetailsDialog {

  late StockModel stock;
  
  final txtName = TextEditingController();
  final txtPriority = TextEditingController();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  Widget buildDialog(BuildContext context, StockModel stock, bool isNew) {

    if (!isNew) {
      titleController.text = stock.title;
      descriptionController.text = stock.description;
    }

    return AlertDialog(
      title: Text((isNew) ? 'new entry' : 'edit entry'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: txtName,
              decoration: const InputDecoration(hintText: 'product name'),
            ),
            TextField(
              controller: txtPriority,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'product priority (1-3)'),
            ),
            ElevatedButton(
              child: const Text('save'),
              onPressed: () {
                
              },
            ),
          ],
        ),
      ),
    );
  }
  
}