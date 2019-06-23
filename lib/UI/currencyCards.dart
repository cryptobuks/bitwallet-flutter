import 'package:bitwallet/UI/theme.dart' as Theme;
import 'package:bitwallet/data/currency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyCards extends StatelessWidget {

  final Currency currency;
  CurrencyCards(this.currency);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.Colors.currencyCard,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                'assets/icon/${currency.symbol.toLowerCase()}.png',   // FIX placeholder image if asset not found
                scale: 10.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(currency.symbol, style: Theme.TextStyles.currencyTitle),
                SizedBox(
                  width: 10.0,
                ),
                _getPriceText(currency),
                //Text('\$${currency.priceUSD.toStringAsFixed(2)}', style: Theme.TextStyles.currencyTitle),
              ]
            ),
        ],
      ),      
    ));
  }


Widget _getPriceText(Currency currency) {
    TextSpan priceTextWidget = new TextSpan(text: "\$${currency.priceUSD.toStringAsFixed(2)}\n",
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
