import 'package:flutter/material.dart';

/* This Dropdown function takes the dropdown data as an input
 it's like a joker to handel all types of data ex. "sting, ints" */
DropdownButton<dynamic> androidDropdown(dropData) {
  List dropDownData = dropData;

  List<DropdownMenuItem<dynamic>> dropdownItems = [];
  //the items loop function
  for (var item in dropDownData) {
    var newItem = DropdownMenuItem(
      child: Text(item),
      value: item,
    );
    dropdownItems.add(newItem);
  }

  return DropdownButton<dynamic>(
    // value: null,  //use it if you want to put initial value
    items: dropdownItems,
    onChanged: (value) {
      // setState(() {
      //   selectedCurrency = value;
      // });
    },
  );
}

//TODO: IOS Picker here (From Angela's Bitcoin project)
