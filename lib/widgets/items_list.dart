import 'package:flutter/material.dart';
import 'package:first_list_app/widgets/item_tile.dart';
import 'package:first_list_app/functionality/items_crud.dart';
import 'package:first_list_app/models/item.dart';
import 'package:provider/provider.dart';

class ItemsList extends StatelessWidget {
  final bool alreadyDone;

  ItemsList({this.alreadyDone});

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemsCrud>(builder: (context, itemsList, child) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: itemsList.itemsCount,
        itemBuilder: (context, index) {
          var item = itemsList.items[index];

          /* Here we do a check on Item isDone to separate "not done yet items & already done items*/
          if (alreadyDone == false) {
            if (item.isDone == false) {
              return GestureDetector(
                onLongPress: () {
                  print('HELLO!!');
                },
                child: ItemTile(
                    itemName: item.name,
                    isChecked: item.isDone,
                    checkboxCallback: (value) {
                      itemsList.changeDoneStatus(item.id, index, item);
                    },
                    deleteCallback: () {
                      itemsList.deleteItem(item.id, index);
                    }),
              );
            } else
              return Container();
          } else if (alreadyDone == true) {
            if (item.isDone == true) {
              return ItemTile(
                  itemName: item.name,
                  isChecked: item.isDone,
                  checkboxCallback: (value) {
                    itemsList.changeDoneStatus(item.id, index, item);
                  },
                  deleteCallback: () {
                    itemsList.deleteItem(item.id, index);
                  });
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
//The ValueListenableBuilder code to try it *****
  @override
  Widget build(BuildContext context) {
    final ValueNotifier items = ValueNotifier(itemData.queryAllItems());
    return ValueListenableBuilder(
        valueListenable: items,
        builder: (BuildContext context, list, Widget child) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list.getAt(index);

              /* Here we do a check on Item isDone to separate "not done yet items &
already done items*/
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
                      list.deleteAt(index);
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
                      list.deleteAt(index);
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
 */

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
