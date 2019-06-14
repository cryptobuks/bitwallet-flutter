import 'package:bitwallet/data/currency.dart';
import 'package:bitwallet/modules/presenter.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements CurrencyListViewContract{
  
  CurrencyListPresenter _presenter;
  List<Currency> _currencies;
  bool _isLoading;
  List<MaterialColor> _colors = [Colors.teal, Colors.indigo, Colors.pink];

  _HomePageState() {
    _presenter = new CurrencyListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.getCurrencies();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text('BitWallet'),
      ),
      body: _isLoading ? new Center(
        child: new CircularProgressIndicator(), 
      )
      : _currencyWidget()
    );
  }

  Widget _currencyWidget() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              itemCount: _currencies.length,
              itemBuilder: (BuildContext context, int index) {
                final Currency currency = _currencies[index];
                final MaterialColor color = _colors[index % _colors.length];

                return _getListItemUI(currency, color);
              },
            ),
          )
        ],
      )
    );
  }

  ListTile _getListItemUI(Currency currency, MaterialColor color) {
    return new ListTile(
      title: new Text(currency.name,
          style: new TextStyle(fontWeight: FontWeight.bold)),
          subtitle: _getSubtitleText(currency.priceUSD, currency.percentChange1h),
      
      leading: new CircleAvatar(
        backgroundColor: color,
        child: new Text(currency.name[0]),
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

  @override
  void onLoadComplete(List<Currency> currencies) {
    setState(() {
      _currencies = currencies;
      _isLoading = false;
    });
  }

  @override
  void onLoadError() {
  }


}