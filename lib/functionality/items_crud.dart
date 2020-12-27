import 'package:first_list_app/models/item.dart';
import 'package:sqflite/sqflite.dart';
import 'package:first_list_app/service/database_connection.dart';

class ItemsCrud {
  final DatabaseConnection instance = DatabaseConnection.instance;

  final table = 'items';

  //Add a new Item, INSERT method
  Future<int> addItem(Item newItem) async {
    Database db = await instance.database;
    return await db.insert(table, newItem.toJson());
  }

  //get items in the box count
  // int get itemsCount {
  //   return box.length;
  // }

  //TODO: This is should be the update method when check item
  //Change the Item status (checked || not checked)
  // void itemDoneStatus(int itemIndex, Item item) {
  //   box.putAt(
  //     itemIndex,
  //     Item(
  //       barCode: item.barCode,
  //       name: item.name,
  //       qty: item.qty,
  //       unitPrice: item.unitPrice,
  //       notes: item.notes,
  //       isDone: !item.isDone, //put the opposite value
  //     ),
  //   );
  // }
}
