import 'package:bitwallet/data/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

void main() async {
  Injector.configure(Flavor.Production);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: new HomePage(),
    );
  }
}
