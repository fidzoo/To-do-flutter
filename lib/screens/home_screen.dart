import 'package:flutter/material.dart';
import 'package:first_list_app/functionality/scan_function.dart';
//import 'package:first_list_app/widgets/items_list.dart';
import 'package:first_list_app/helpers/check_connectivity.dart';
import 'package:first_list_app/screens/add_item_screen.dart';

import 'package:first_list_app/screens/test_page.dart';

class HomeScreen extends StatelessWidget {
  static const String screenId = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List App'),
        actions: <Widget>[
          //if you want to add something beside the title
        ],
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.lightBlueAccent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.camera),
                          onPressed: () async {
                            checkConnectivity(
                                context); //first check if mobile is connected to internet
                            Map<String, dynamic> scannedItemData =
                                await scan(); //run the scan function and get the code back
                            //TODO: you need to make the return value not int only because you may scan a QR codes which return more data
                            if (scannedItemData['name'] == '') {}
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddItemScreen(
                                  itemData: scannedItemData,
                                ),
                              ),
                            ); //Navigate to Add Item Screen
                          },
                        ),
                        //This is a test page
                        IconButton(
                          icon: Icon(Icons.beach_access),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TestPage()));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          //TODO: The original code is below to get it back
          //* note down
        ],
      ),
    );
  }
}

/*The idea here is that the lower container is expanded to make it always stick after the upper container*/
/*
Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: ItemsList(
              alreadyDone: false,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: ItemsList(
                alreadyDone: true,
              ),
            ),
          ),

 */
