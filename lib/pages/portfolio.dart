import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitwallet/UI/theme.dart' as Theme;

class PortfolioPage extends StatefulWidget {
  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: Text('Add assets to your portfolio.', style: TextStyle(color: Theme.Colors.currencyTitle),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // TODO: Add asset to portfolio
        child: Icon(Icons.add),
        heroTag: 'Add asset',
        foregroundColor: Theme.Colors.currencyTitle,
      ),
    backgroundColor: Theme.Colors.currencyCard,
    );
  }
}