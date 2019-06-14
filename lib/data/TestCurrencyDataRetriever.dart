

import 'package:bitwallet/data/currency.dart';

class TestCurrencyDataRetriever implements ListOfCurrencies {
  @override
  Future<List<Currency>> fetchCurrencies() {
    return new Future.value(currencies);
  }
}

// Testing data
var currencies = <Currency>[
  new Currency(name: "Bitcoin", priceUSD: "8200", percentChange1h: "0.48"),
  new Currency(name: "Ethereum", priceUSD: "250", percentChange1h: "-0.02"),
  new Currency(name: "XRP", priceUSD: "0.4", percentChange1h: "0.39")
];