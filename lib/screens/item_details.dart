//import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//import 'package:sqflite/sqflite.dart';
import 'package:d_pos/models/stock_model.dart';
import 'package:d_pos/db/stock_db.dart';
import 'package:intl/intl.dart';
//import 'package:intl/intl.dart' as intl;

// ignore: must_be_immutable
class ItemDetails extends StatefulWidget {
  final String appBarTitle;
  final StockModel stock;
  // ignore: use_key_in_widget_constructors
  const ItemDetails(this.stock, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return ItemDetailsState(stock, appBarTitle);
  }
}

class ItemDetailsState extends State<ItemDetails> {
  static final _priorities = ['High', 'Low'];

  String appBarTitle;
  StockModel stock;

  String barcodeValue = "";

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  ItemDetailsState(this.stock, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.headlineSmall;
    titleController.text = stock.title;
    descriptionController.text = stock.description;
    priceController.text = stock.price;

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            moveToLastScreen();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            // first element
            ListTile(
              title: DropdownButton(
                items: _priorities.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                style: textStyle,
                value: getPriorityAsString(stock.priority),
                onChanged: (valueSelectedByUser) {
                  setState(() {
                    debugPrint('user selected $valueSelectedByUser priority');
                    updatePriorityAsInt(valueSelectedByUser.toString());
                  });
                },
              ),
            ),

            // second element
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('something changed in the title textfield');
                  updateStockTitle();
                },
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),

            // third element
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextField(
                controller: descriptionController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('something changed in the description textfield');
                  updateStockDescription();
                },
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),

            // fourth element
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextField(
                controller: codeController,
                style: textStyle,
                onChanged: (value) {
                  debugPrint('something changed in the barcode textfield');
                },
                decoration: InputDecoration(
                    labelText: 'barcode value',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),

            // fifth element
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: TextField(
                controller: priceController,
                style: const TextStyle(
                  height: 2.0,
                ),
                onChanged: (value) {
                  debugPrint('something changed in the price textfield');
                  updateStockPrice();
                },
                decoration: InputDecoration(
                    labelText: 'product price',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
            ),

            const SizedBox(
              width: 100.0,
              child: TextField(
                style: TextStyle(fontSize: 40.0, height: 2.0, color: Colors.black),
              ),
            ),

            // sixth element
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  // save button
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(70, 4, 66, 4),
                          elevation: 0),
                      onPressed: () {
                        setState(() {
                          debugPrint("save button clicked");
                          _save();
                        });
                      },
                      child: const Text(
                        "save",
                        textScaleFactor: 1.2,
                      ),
                    ),
                  ),

                  Container(
                    width: 5.0,
                  ),

                  // delete button
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 135, 38, 6),
                          elevation: 0),
                      onPressed: () {
                        setState(() {
                          debugPrint("delete button clicked");
                          _delete();
                        });
                      },
                      child: const Text(
                        "delete",
                        textScaleFactor: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // fifth element

            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  // scanner button
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 135, 38, 6),
                          elevation: 0),
                      onPressed: () {
                        scanBarcodeNormal();
                      },
                      child: const Text(
                        "scan bar code",
                        textScaleFactor: 1.2,
                      ),
                    ),
                  ),
                  Container(
                    height: 5.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void scanBarcodeNormal() async {
    String scanResults;

    try {
      scanResults = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'cancel', true, ScanMode.BARCODE);
    } on PlatformException {
      scanResults = "ERROR!! failed to get platform version";
    }
    setState(() {
      barcodeValue = scanResults;
      codeController.text = barcodeValue;
    });
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  // convert priority from string to integer before saving it into the database
  void updatePriorityAsInt(String value) {
    switch (value) {
      case 'High':
        stock.priority = 1;
        break;
      case 'Low':
        stock.priority = 2;
        break;
      default:
    }
  }

  String getPriorityAsString(int value) {
    String priority = "";
    switch (value) {
      case 1:
        priority = _priorities[0]; // 'High'
        break;
      case 2:
        priority = _priorities[1]; // 'Low'
        break;
      default:
    }
    return priority;
  }

  // update the title of Stock Object
  void updateStockTitle() {
    stock.title = titleController.text;
  }

  // update the description of Stock Object
  void updateStockDescription() {
    stock.description = descriptionController.text;
  }

  // update the price of the stock object
  void updateStockPrice () {
    stock.price = priceController.text;
  }

  // save data into the database
  void _save() async {
    moveToLastScreen();
    stock.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (stock.id != null) {
      result = await StockDatabase.instance.updateStockItem(stock);
    } else {
      result = await StockDatabase.instance.insertStock(stock);
    }
    if (result != 0) {
      _showAlertDialog(
          'status:SUCCESS', 'stock item saved/updated successfully');
    } else {
      _showAlertDialog(
          'status:ERROR!!', 'ERROR!! item details NOT saved/updated');
    }
  }

  void _delete() async {
    if (stock.id == null) {
      _showAlertDialog('status:ERROR!!', 'item NOT found');
      return;
    }
    int result = await StockDatabase.instance.deleteStockItem(stock.id);
    if (result != 0) {
      _showAlertDialog('status:SUCCESS', 'item deleted successfully');
    } else {
      _showAlertDialog('status:DELETE ERROR!!', 'ERROR!! item NOT deleted');
    }
  }

  void _showAlertDialog(String title, String msg) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(msg),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
