import 'dart:convert';

import 'package:cryptoapp/model/cryptoModel.dart';
import "package:http/http.dart" as http;

class Cryptoservices {
  Future<List<Cryptomodel>?> getDetails(context) async {
    final url =
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
    
      
      return json.map((data) => Cryptomodel.fromJson(data)).toList();
    } else {
      throw "An error occured";
    }
  }
}
