import 'package:bitwallet/UI/theme.dart' as Theme;
import 'package:bitwallet/data/currency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyCards extends StatelessWidget {

  final Currency currency;
  CurrencyCards(this.currency);

  @override
  Widget build(BuildContext context) {
    final currencyImage = new Container(
      alignment: new FractionalOffset(0.0, 0.5),
      margin: const EdgeInsets.only(left: 1.0),
      child: new Hero(
        tag: 'currency-icon-${currency.symbol}',
        child: new Image(
          image: new AssetImage("assets/icon/${currency.symbol.toLowerCase()}.png"),
          height: Theme.Dimens.currencyHeight,
          width: Theme.Dimens.currencyWidth,
        ),
      ),
    );

    final currencyCard = new Container(
      margin: const EdgeInsets.only(left: 24.0, right: 24.0),
      decoration: new BoxDecoration(
        color: Theme.Colors.currencyCard,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(color: Colors.black,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0))
        ],
      ),
      // CURRENCY TEXT
      child: new Container(
        margin: const EdgeInsets.only(top: 16.0, left: 72.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(currency.name, style: Theme.TextStyles.currencyTitle),
            new Container(
              color: const Color(0xFF00C6FF),
              width: 24.0,
              height: 1.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0)
            ),
            new Row(
              children: <Widget>[
                _getSubtitleText(currency),
              ],
            )
          ],
        ),
      ),
    );

    return new Container(
      height: 120.0,
      margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: new FlatButton(
        onPressed: () {
          //TODO: Redirect to market page for the specific currency.
        },
        child: new Stack(
          children: <Widget>[
            currencyCard,
            currencyImage,
          ],
        ),
      ),
    );
  }


Widget _getSubtitleText(Currency currency) {
    TextSpan priceTextWidget = new TextSpan(text: "\$${currency.priceUSD.toStringAsFixed(4)}\n",
    style: new TextStyle(color: Theme.Colors.currencyTitle));
    
    String percentageChangeText = "Last hour: ${currency.percentChange1h}%";
    TextSpan percentageChangeTextWidget;

    if(double.parse(currency.percentChange1h) > 0.0) {
      percentageChangeTextWidget = new TextSpan(text: percentageChangeText,
      style: new TextStyle(color: Theme.Colors.currencyPercentUp));
    }
    else{
      percentageChangeTextWidget = new TextSpan(text: percentageChangeText,
      style: new TextStyle(color: Theme.Colors.currencyPercentDown));
    }
    return new RichText(
      text: new TextSpan(
        children: [priceTextWidget, percentageChangeTextWidget]
      ),
    );

  }

}
