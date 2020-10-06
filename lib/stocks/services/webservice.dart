import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/stocks/model/stocks.dart';

class Webservice {
  Future<List<Stock>> getStocks() async {
    //final url = "https://silicon-rhinoceros.glitch.me/stocks";
    final url = "http://potato.ahmd.info/noor.json";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Iterable json = jsonDecode(response.body);
      return json.map((stock) => Stock.fromJson(stock)).toList();
    } else {
      throw Exception("Error fetching stocks");
    }
  }
}
