import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  final List currencies;
  HomePage(this.currencies);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List currencies;
  List<MaterialColor> _colors = [Colors.teal, Colors.indigo, Colors.pink];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('BitWallet'),
      ),
      body: _currencyWidget(),
    );
  }

  Widget _currencyWidget() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              itemCount: widget.currencies.length,
              itemBuilder: (BuildContext context, int index) {
                final Map currency = widget.currencies[index];
                final MaterialColor color = _colors[index % _colors.length];

                return _getListItemUI(currency, color);
              },
            ),
          )
        ],
      )
    );
  }

  ListTile _getListItemUI(Map currency, MaterialColor color) {
    return new ListTile(
      title: new Text(currency['name'],
          style: new TextStyle(fontWeight: FontWeight.bold)),
          subtitle: _getSubtitleText(currency['price_usd'], currency['percent_change_1h']),
      
      leading: new CircleAvatar(
        backgroundColor: color,
        child: new Text(currency['name'][0]),
      ),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String priceUSD, String percentChange1h) {
    TextSpan priceTextWidget = new TextSpan(text: "\$$priceUSD\n",
    style: new TextStyle(color: Colors.black));
    
    String percentageChangeText = "Last hour: $percentChange1h%";
    TextSpan percentageChangeTextWidget;

    if(double.parse(percentChange1h) > 0.0) {
      percentageChangeTextWidget = new TextSpan(text: percentageChangeText,
      style: new TextStyle(color: Colors.green));
    }
    else{
      percentageChangeTextWidget = new TextSpan(text: percentageChangeText,
      style: new TextStyle(color: Colors.red));
    }

    return new RichText(
      text: new TextSpan(
        children: [priceTextWidget, percentageChangeTextWidget]
      ),
    );

  }


}