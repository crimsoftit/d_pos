// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:d_pos/db/stock_db.dart';
import 'package:d_pos/model/stock_model.dart';
//import 'package:d_pos/model/stock_item.dart';
import 'package:d_pos/screens/item_details.dart';

class ItemsList extends StatefulWidget {
  const ItemsList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ItemsListState();
  }
}

class ItemsListState extends State<ItemsList> {
  List<StockModel> stockItems = [];
  bool isLoading = false;

  int count = 0;

  @override
  void initState() {
    super.initState();

    //refreshStockList();
    updateListView();
  }

  @override
  void dispose() {
    StockDatabase.instance.close();

    super.dispose();
  }

  // Future refreshStockList() async {
  //   setState(() => isLoading = true);
  //   stockItems = await StockDatabase.instance.getStockMapList();
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    if (stockItems == null) {
      stockItems = <StockModel>[];
      //refreshStockList();
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stock items',
          style: TextStyle(fontSize: 24),
          selectionColor: Colors.white,
        ),
        actions: const [Icon(Icons.search), SizedBox(width: 12)],
        foregroundColor: Colors.white,
      ),
      body: getItemsListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          //navigateToItemDetails('add stock item');
          navigateToDetail(StockModel('', 2, ''), 'add stock item...');
        },
        tooltip: 'add stock item...',
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView getItemsListView() {
    TextStyle? titleStyle = Theme.of(context).textTheme.headlineSmall;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: getPriorityColor(stockItems[position].priority),
              child: getPriorityIcon(stockItems[position].priority),
            ),
            title: Text(
              stockItems[position].title,
              style: titleStyle,
            ),
            subtitle: Text(stockItems[position].description),
            trailing: GestureDetector(
                child: const Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
                onTap: () {
                  _delete(context, stockItems[position]);
                }),
            onTap: () {
              debugPrint('listtile tapped');
              navigateToDetail(this.stockItems[position], 'edit stock item...');
            },
          ),
        );
      },
    );
  }

  void _delete(BuildContext context, StockModel stock) async {
    int result = await StockDatabase.instance.deleteStockItem(stock.id);
    if (result != 0) {
      // ignore: use_build_context_synchronously
      _showSnackBar(context, 'item deleted successfully');
      updateListView();
      //refreshStockList();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('snack'),
      duration: const Duration(seconds: 1),
      action: SnackBarAction(
        label: 'ACTION',
        onPressed: () {},
      ),
    ));
  }

  // returns color code for priorities
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
      case 2:
        return Colors.yellow;
      default:
        return Colors.green;
    }
  }

  // returns priority icon
  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return const Icon(Icons.play_arrow);
      case 2:
        return const Icon(Icons.keyboard_arrow_right);
      default:
        return const Icon(Icons.keyboard_arrow_right);
    }
  }

  void navigateToDetail(StockModel stock, String title) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ItemDetails(stock, title);
    }));
    updateListView();
  }

  void updateListView() {
    final Future<Database> dbFuture =
        StockDatabase.instance.initializeDatabase();
    dbFuture.then((database) {
      Future<List<StockModel>> stockListFuture =
          StockDatabase.instance.getStockList();
      stockListFuture.then((stockItems) {
        setState(() {
          this.stockItems = stockItems;
          this.count = stockItems.length;
        });
      });
    });
  }
}
