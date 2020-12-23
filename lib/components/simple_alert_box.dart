import 'package:flutter/material.dart';

Future<void> showSimpleAlertBox(title, body, context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          textDirection: TextDirection.rtl,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                body,
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ),
        actions: [
          FlatButton(
            child: Text('حسنًا'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
