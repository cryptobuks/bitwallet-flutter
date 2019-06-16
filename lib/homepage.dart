import 'package:flutter/material.dart';
import 'pages/market.dart';
import 'pages/portfolio.dart';
//import 'UI/gradient_appbar.dart';
import 'UI/theme.dart' as Theme;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> pages = [
    MarketPage(),
    PortfolioPage(),
  ];

  // Build the homepage, defaults to marketpage for now
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
          children: pages,
        ),
        bottomNavigationBar: Container(
          // decoration: BoxDecoration(
          //   boxShadow: [
          //     BoxShadow(
          //       offset: Offset(10, 10)
          //     )
          //   ]
          // ),
          margin: EdgeInsets.only(bottom: 20),
          child: new TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.show_chart),
              ),
              Tab(
                icon: Icon(Icons.assessment),
              ),
            ],
            unselectedLabelColor: Theme.Colors.appBarUnfocused,
            labelColor: Theme.Colors.appBarFocused,
            indicatorColor: Theme.Colors.appBarFocused,
          ),
        ),
        backgroundColor: Theme.Colors.currencyCard,
      ),
    );


    // return new Material(
    //   child: new Column(
    //     children: <Widget>[
    //     new GradientAppBar('BitWallet'),    
    //     new MarketPage(),
    //     new NavBar(),
        
    //   ],
    //   ),
    // );
  }
}