import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BarcodeSearch {
  final String barcode;

  BarcodeSearch({this.barcode});

  Future getDate() async {
    print('response is:');
    var data;
    var url = 'http://10.0.2.2:8000/api/items/search-barcode/$barcode';
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      data = jsonResponse;
      //end of if
    } else {
      print('Request failed with status: ${response.statusCode}.');
      //TODO: Make a connection error alert here

    }

    return data;
  }
}
