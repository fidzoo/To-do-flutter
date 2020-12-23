import 'package:first_list_app/models/item.dart';
import 'package:flutter/material.dart';
import 'models/items_data.dart';
import 'screens/home_screen.dart';
import 'package:first_list_app/screens/add_item_screen.dart';

import 'package:provider/provider.dart'; //provider package

//for hive:
//import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

/*Main function is async due to the use of path_provider for Hive*/
void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //used this cuz the updated flutter needs this if you use async with main
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();

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
      create: (context) => ItemsData(),
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
