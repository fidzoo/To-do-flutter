import 'package:first_list_app/models/item.dart';
import 'package:hive/hive.dart';

class ItemsCrud {
  //get the box
  final box = Hive.box('itemsLists');

  //get items in the box count
  int get itemsCount {
    return box.length;
  }

  //Add a new Item
  void addItem(Item newItem) {
    box.add(newItem);
  }

  //Change the Item status (checked || not checked)
  void itemDoneStatus(int itemIndex, Item item) {
    box.putAt(
      itemIndex,
      Item(
        barCode: item.barCode,
        name: item.name,
        qty: item.qty,
        unitPrice: item.unitPrice,
        notes: item.notes,
        isDone: !item.isDone, //put the opposite value
      ),
    );
  }
}
