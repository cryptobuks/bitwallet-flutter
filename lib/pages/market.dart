import 'package:bitwallet/UI/currencyCards.dart';
import 'package:bitwallet/data/currency.dart';
import 'package:bitwallet/modules/presenter.dart';
import 'package:flutter/material.dart';
import 'package:bitwallet/UI/theme.dart' as Theme;

class MarketPage extends StatefulWidget {
  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> implements CurrencyListViewContract{
  
  CurrencyListPresenter _presenter;
  List<Currency> _currencies;
  bool _isLoading;

  _MarketPageState() {
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
    return _isLoading ? new Center(
        child: new CircularProgressIndicator(), 
      )
      :
      new Flexible(
        child: new Container(
          color: Theme.Colors.currencyPageBackground,
          child: new ListView.builder(
            itemCount: _currencies.length,
            itemBuilder: (BuildContext context, int index) => new CurrencyCards(_currencies[index]),
          ),
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