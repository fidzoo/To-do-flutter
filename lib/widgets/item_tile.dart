import 'package:flutter/material.dart';

/*
this is for the whole ITEM Box itself, contents, decoration, etc
*/
class ItemTile extends StatelessWidget {
  final bool isChecked;
  final String itemName;
  final Function checkboxCallback;
  final Function deleteCallback;
  //final Function longPressCallback; //you can late make it open the edit screen

  ItemTile({
    this.isChecked,
    this.itemName,
    this.checkboxCallback,
    this.deleteCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //  onLongPress: longPressCallback,
      title: Text(
        itemName,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: isChecked,
            onChanged: checkboxCallback,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: deleteCallback,
          ),
        ],
      ),
    );
  }
}
