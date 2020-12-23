import 'package:flutter/material.dart';

class NumberPicker extends StatefulWidget {
  final Function getNumber;

  NumberPicker({this.getNumber});

  @override
  _NumberPickerState createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  int _n = 1;

  void add() {
    setState(() {
      _n++;
      widget.getNumber(_n); //to send the number to the other screen
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
      widget.getNumber(_n);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          heroTag: 'btn1',
          onPressed: minus,
          child: Icon(const IconData(0xe15b, fontFamily: 'MaterialIcons'),
              color: Colors.black),
          backgroundColor: Colors.white,
        ),
        Text('$_n', style: TextStyle(fontSize: 60.0)),
        FloatingActionButton(
          heroTag: 'btn2',
          onPressed: add,
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}
