import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        drawer: new Drawer(),
        appBar: AppBar(
          title: Text('Markets'), // TODO: Automatically change the title based on which page that is viewed
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 26),
            child: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.show_chart),
              ),
              Tab(
                icon: Icon(Icons.person),
              ),
            ],
            unselectedLabelColor: Theme.Colors.appBarUnfocused,
            labelColor: Theme.Colors.appBarFocused,
            indicatorColor: Theme.Colors.appBarFocused,
          ),
          )
        ),
        body: TabBarView(
          children: pages,
        ),
        backgroundColor: Theme.Colors.currencyCard,
      ),
    );
  }
}