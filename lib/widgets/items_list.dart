import 'package:flutter/material.dart';
import 'package:first_list_app/widgets/item_tile.dart';
import 'package:first_list_app/functionality/items_crud.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ItemsList extends StatelessWidget {
  final bool alreadyDone;

  ItemsList({this.alreadyDone});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('itemsLists');
    return ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (BuildContext context, box, Widget child) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: box.length,
            itemBuilder: (context, index) {
              final item = box.getAt(index);

              /* Here we do a check on Item isDone to separate "not done yet items & already done items*/
              if (alreadyDone == false) {
                if (item.isDone == false) {
                  return ItemTile(
                    itemName: item.name,
                    isChecked: item.isDone,
                    checkboxCallback: (value) {
                      ItemsCrud itemData = ItemsCrud();
                      itemData.itemDoneStatus(index, item);
                    },
                    deleteCallback: () {
                      box.deleteAt(index);
                    },
                  );
                } else
                  return Container();
              } else if (alreadyDone == true) {
                if (item.isDone == true) {
                  return ItemTile(
                    itemName: item.name,
                    isChecked: item.isDone,
                    checkboxCallback: (value) {
                      ItemsCrud itemData = ItemsCrud();
                      itemData.itemDoneStatus(index, item);
                    },
                    deleteCallback: () {
                      box.deleteAt(index);
                    },
                  );
                } else
                  return Container();
              }

              return null;
            },
          );
        });
  }
}

/*
The old provider code
return Consumer<ItemsData>(
      builder: (context, itemsData, child) {
        return ListView.builder(
          itemCount: itemsData.itemsCount,
          itemBuilder: (context, index) {
            final task = itemsData.box.getAt(index);

            return ItemTile(
              itemName: task.name,
              isChecked: task.isDone,
              checkboxCallback: null, //it will open the change screen later
            );
          },
        );
      },
    );
 */
