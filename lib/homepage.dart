import 'package:flutter/material.dart';
import 'pages/market.dart';
import 'UI/gradient_appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Widget> pages = [
  //   MarketPage(),
  //   PortfolioPage(),
  // ];

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
        new GradientAppBar('BitWallet'),
        new MarketPage(),
      ],
      ),
    );
  }
}