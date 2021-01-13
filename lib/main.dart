import 'package:first_list_app/models/item.dart';
import 'package:flutter/material.dart';
import 'models/items_data.dart';
import 'functionality/items_crud.dart';
import 'screens/home_screen.dart';
import 'package:first_list_app/screens/add_item_screen.dart';

import 'package:provider/provider.dart'; //provider package

void main() {
  runApp(ListApp());
}

class ListApp extends StatefulWidget {
  @override
  _ListAppState createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemsCrud(),
      child: MaterialApp(
        initialRoute: HomeScreen.screenId,
        routes: {
          HomeScreen.screenId: (context) => HomeScreen(),
          AddItemScreen.screenId: (context) => AddItemScreen(),
          //Type the routes here ex.:
          //WelcomeScreen.screenId: (context) => WelcomeScreen(),
        },
      ),
    );
  }
}
