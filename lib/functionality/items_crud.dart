import 'package:first_list_app/models/item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:first_list_app/service/database_connection.dart';
import 'package:flutter/foundation.dart'; //To use the "ChangeNotifier"
import 'dart:collection'; //For the UnmodifiableListView

class ItemsCrud extends ChangeNotifier {
  final DatabaseConnection instance = DatabaseConnection.instance;
  final String table = 'items';

  List<Item> _items = [];

  ItemsCrud() {
    if (instance != null) {
      queryAllItems();
    }
  }

  //get items count
  int get itemsCount {
    return _items.length;
  }

  UnmodifiableListView<Item> get items {
    return UnmodifiableListView(_items);
  }

  //ADD a new Item, INSERT method
  void addItem(Item newItem) async {
    Database db = await instance.database;
    int itemId = await db.insert(table, newItem.toJson());
    newItem.id = itemId; //you must make it know the generated id in the DB

    _items.add(newItem);

    notifyListeners();
  }

  //GET all Items from Database
  void queryAllItems() async {
    Database db = await instance.database;

    var result = await db.query(table); //get all columns

    result.forEach((element) {
      var item = Item.fromJson(element);
      _items.add(item);
    });

    notifyListeners();
  }

  //UPDATE Item in the Database
  void updateItem(int positionIndex, Item item) async {
    Database db = await instance.database;

    await db
        .update(table, item.toJson(), where: 'id = ?', whereArgs: [item.id]);

    _items[positionIndex] = item;

    notifyListeners();
  }

  //DELETE Item From the Database
  void deleteItem(int id, int positionIndex) async {
    Database db = await instance.database;
    await db.delete(table, where: 'id = ?', whereArgs: [id]);
    _items.removeAt(positionIndex);
    notifyListeners();
  }

  //Change the Item status (checked || not checked)
  void changeDoneStatus(int id, int positionIndex, Item item) async {
    Database db = await instance.database;

    item.isDone = !item.isDone; //use the opposite value

    await db.update(table, item.toJson(), where: 'id = ?', whereArgs: [id]);

    _items[positionIndex] = item;

    notifyListeners();
  }
}
