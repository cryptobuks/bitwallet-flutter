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
    PortfolioPage(),
    MarketPage(),
  ];


  // Build the homepage, defaults to marketpage for now
  // Implement TabController instead of DefaultTabController
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        drawer: new Drawer(),
        appBar: AppBar(
          //title: Text('Portfolio'), 
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 26),
            child: TabBar(
            tabs: [
              Tab(
                //text: 'Markets',
                icon: Icon(Icons.person),
              ),
              Tab(
                //text: 'Portfolio',
                icon: Icon(Icons.show_chart),
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

class PageTabs {
  final String title;
  final Icon icon;
  PageTabs({this.title, this.icon});
}