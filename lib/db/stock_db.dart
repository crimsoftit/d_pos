import 'dart:io';
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:d_pos/models/stock_model.dart';
//import 'package:d_pos/model/stock_item.dart';

class StockDatabase {
  static final StockDatabase instance = StockDatabase._init();

  static Database? _database;

  String stockTable = 'stock';
  String colId = 'id';
  String colTitle = 'title';
  String colDesc = 'description';
  String colPriority = 'priority';
  String colPrice = 'price';
  String colBcodeValue = 'bcodeValue';
  String colDate = 'date';

  StockDatabase._init();

  factory StockDatabase() {
    StockDatabase instance = StockDatabase._init();
    return instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB('stock.db');
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}stock.db';

    // Open/create the database at a given path
    var stockDatabase =
        await openDatabase(path, version: 1, onCreate: _createDB);
    return stockDatabase;
  }

  Future<Database> initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT';
    const intType = 'INTEGER';

    await db.execute('''
      CREATE TABLE $stockTable (
        $colId $idType,
        $colTitle $textType,
        $colDesc $textType,
        $colPriority $intType,
        $colPrice $textType,
        $colBcodeValue $textType,
        $colDate $textType
      )''');
  }

  // fetch operation: get all stock objects from the database
  Future<List<Map<String, dynamic>>> getStockMapList() async {
    Database db = await instance.database;
    // var rawResult = await db.rawQuery('SELECT * FROM $stockTable order by $colPriority');
    var ormResult = await db.query(stockTable, orderBy: colDate);
    return ormResult;
  }

  Future<int> insertStock(StockModel stock) async {
    var db = await instance.database;
    var result = await db.insert(stockTable, stock.toMap());
    return result;
  }

  Future<int> updateStockItem(StockModel stock) async {
    final db = await instance.database;
    return db.update(
      stockTable,
      stock.toMap(),
      where: '$colId = ?',
      whereArgs: [stock.id],
    );
  }

  Future<int> deleteStockItem(int? id) async {
    var db = await instance.database;

    var result =
        await db.rawDelete('DELETE FROM $stockTable WHERE $colId = $id');
    return result;
  }

  // get number of stock items in the database
  Future<int?> getStockCount() async {
    final db = await instance.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $stockTable');
    int? result = Sqflite.firstIntValue(x);
    return result;
  }

  // get the 'Map List' [ List<Map> ] and convert it to 'Stock List' [ List<Stock> ]
  Future<List<StockModel>> getStockList() async {
    var stockMapList = await getStockMapList();
    int count = stockMapList.length;

    List<StockModel> stockItems = <StockModel>[];

    // for loop to create a 'Stock List' from 'Map List'
    for (int i = 0; i < count; i++) {
      stockItems.add(StockModel.fromMapObject(stockMapList[i]));
    }
    return stockItems;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
