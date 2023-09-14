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
class StockDetails extends StatefulWidget {
  final String appBarTitle;
  final StockModel stock;
  // ignore: use_key_in_widget_constructors
  const StockDetails(this.stock, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return StockDetailsState(stock, appBarTitle);
  }
}

class StockDetailsState extends State<StockDetails> {

  
  
  static final _priorities = ['High', 'Low'];

  String appBarTitle;
  StockModel stock;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController codeController = TextEditingController();
    

  StockDetailsState(this.stock, this.appBarTitle);


  final _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.bodyMedium;
    titleController.text = stock.title;
    descriptionController.text = stock.description;
    priceController.text = stock.price;
    codeController.text = stock.bcodeValue;

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

            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[

                  // first element
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: TextFormField(
                      controller: titleController,
                      style: textStyle,
                      onChanged: (value) {
                        debugPrint('something changed in the title textfield');
                        updateStockTitle();
                      },
                      decoration: InputDecoration(
                        labelText: 'product name',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                      ),

                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),

                  // second element
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: TextFormField(
                      controller: descriptionController,
                      style: textStyle,
                      onChanged: (value) {
                        debugPrint('something changed in the description textfield');
                        updateStockDescription();
                      },
                      decoration: InputDecoration(
                        labelText: 'description',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),

                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),

                  // third element
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: TextFormField(
                      controller: priceController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                        signed: true,
                      ),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      style: textStyle,
                      onChanged: (value) {
                        debugPrint('something changed in the price textfield');
                        updateStockPrice();
                      },
                      decoration: InputDecoration(
                        labelText: 'product price',
                        labelStyle: textStyle,
                        //icon: const Icon(Icons.phone_iphone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),

                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter some value...';
                        }
                        return null;
                      },
                    ),
                  ),

                  
                  // fourth element
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: TextFormField(
                      controller: codeController,
                      style: textStyle,
                      onChanged: (value) {
                        debugPrint('something changed in the barcode value textfield');
                        updateStockCodeValue();
                      },
                      decoration: InputDecoration(
                        labelText: 'barcode value',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),

                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),

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
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Processing Data')),
                                );
                                 _save();
                              }
                            },
                            child: const Text(
                              "Submit"
                            ),
                          ),
                        ),

                        Container(
                          width: 5.0,
                        ),

                        // cancel button
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 135, 38, 6),
                                elevation: 0),
                            onPressed: () {
                              setState(() {
                                debugPrint("cancel button clicked");
                                //_delete();
                              });
                              moveToLastScreen();
                            },
                            child: const Text(
                              "cancel",
                              textScaleFactor: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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


            

            // // fifth element

            // Padding(
            //   padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            //   child: Row(
            //     children: <Widget>[
            //       // scanner button
            //       Expanded(
            //         child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //               backgroundColor:
            //                   const Color.fromARGB(255, 135, 38, 6),
            //               elevation: 0),
            //           onPressed: () {
            //             scanBarcodeNormal();
            //           },
            //           child: const Text(
            //             "scan bar code",
            //             textScaleFactor: 1.2,
            //           ),
            //         ),
            //       ),
            //       Container(
            //         height: 5.0,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
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

  void updateStockCodeValue () {
    stock.bcodeValue = codeController.text;
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

  


  void _showAlertDialog(String title, String msg) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(msg),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
