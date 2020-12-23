import 'package:flutter/material.dart';
import 'package:first_list_app/service/search_barcode.dart';

import 'package:barcode_scan/barcode_scan.dart';

Future<Map<String, dynamic>> scan() async {
  //**remember to use try & catch

  //The camera scan result
  var scanResult = await BarcodeScanner.scan();
  //convert the format to string
  String barFormat = scanResult.format.toString();

  String barNumber;

  //Do a switch cases
  switch (barFormat) {
    case 'unknown':
      {
        barNumber = scanResult.rawContent;
      }
      break;
    case 'ean13':
      {
        barNumber = scanResult.rawContent;
      }
      break;
    case 'upce':
      {
        //do something

      }
      break;
    case 'qr':
      {
        //do something
        //TODO: Handle the QR Code Case
      }
      break;
    case 'pdf417':
      {
        //do something

      }
      break;
    case 'aztec':
      {
        //do something

      }
      break;
    case 'code39':
      {
        //do something

      }
      break;
    case 'code93':
      {
        //do something

      }
      break;
    case 'ean8':
      {
        //do something

      }
      break;
    case 'code128':
      {
        //do something

      }
      break;
    case 'dataMatrix':
      {
        //do something

      }
      break;
    case 'interleaved2of5':
      {
        //do something

      }
      break;
    default:
      {
        //do something
      }
      break;
  }

  //Do the database search:
  BarcodeSearch search = BarcodeSearch(barcode: barNumber);
  var data = await search.getDate();
  Map<String, dynamic> itemData;
  var item = data['item'];

  if (data['is found'] == true) {
    itemData = {
      'barCode': barNumber,
      'name': item['item_name'],
    };
  } else if (data['is found'] == false) {
    itemData = {
      'barCode': barNumber,
      'name': '',
    };
  }

  return itemData;
/*
  // Available results
  print(
      'Type: ${scanResult.type}'); // The result type (barcode, cancelled, failed)
  print('RawContent: ${scanResult.rawContent}'); // The barcode content
  print('Format: ${scanResult.format}'); // The barcode format (as enum)
  print(
      'FormatNote: ${scanResult.formatNote}'); // If a unknown format was scanned this field contains a note
*/

  // int scannedCode = 565659956;
  //
  // Map<String, dynamic> itemData = {
  //   'barCode': 565659956,
  //   'name': 'زبادي مضروب في الخلاط',
  //   'qty': 1,
  //   'unitPrice': 0.00,
  //   'notes': '',
  // };
}
