import 'package:http/http.dart' as http;
import 'package:bitwallet/data/currency.dart';
import 'dart:convert';

class CurrencyDataRetriever implements ListOfCurrencies {
  String apiURL = 'https://api.coinmarketcap.com/v1/ticker/?limit=50';
  @override 
  Future<List<Currency>> fetchCurrencies() async {

    http.Response response = await http.get(apiURL);
    final List responseBody = json.decode(response.body);
    final statusCode = response.statusCode;

    // Throw error if something went wrong when retreiving the data
    if(statusCode != 200 || responseBody == null){
      throw new FetchDataException("An error has ocurred: [Status Code: $statusCode]");
    }

    return responseBody.map( (c) => new Currency.fromMap(c) ).toList();
  }
}