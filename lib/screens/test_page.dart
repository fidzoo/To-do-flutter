import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page'),
        actions: <Widget>[
          //if you want to add something beside the title
        ],
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 50.0,
                color: Colors.purple,
              ),
              Container(
                height: 100.0,
                color: Colors.orange,
              ),
              Container(
                height: 200.0,
                color: Colors.deepOrangeAccent,
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    color: Colors.blueGrey,
                  ),
                  Container(
                    height: 200.0,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
