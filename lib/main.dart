import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'homepage.dart';
import 'dart:convert';

void main() async {
  List currencies = await getCurrencies();
  runApp(new MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final List _currencies;
  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: new HomePage(_currencies),
    );
  }
}


Future<List> getCurrencies() async {
  String apiURL = 'https://api.coinmarketcap.com/v1/ticker/?limit=50';
  http.Response response = await http.get(apiURL);
  return json.decode(response.body);
}