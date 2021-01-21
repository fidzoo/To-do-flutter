import 'package:flutter/material.dart';
import 'package:first_list_app/widgets/item_tile.dart';
import 'package:first_list_app/functionality/items_crud.dart';
import 'package:provider/provider.dart';
import 'package:first_list_app/screens/Edit_item_screen.dart';

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditItemScreen(
                        itemData: item,
                        positionIndex: index,
                      ),
                    ),
                  );
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
              return GestureDetector(
                onLongPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditItemScreen(
                        itemData: item,
                        positionIndex: index,
                      ),
                    ),
                  );
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
