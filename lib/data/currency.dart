// Model class for the currency
class Currency {
  String name;
  String symbol;
  String priceUSD;
  String percentChange1h;
  String percentChange24h;
  String percentChange7d;

  Currency({this.name, this.symbol, this.priceUSD, this.percentChange1h, this.percentChange24h, this.percentChange7d}); //Constructor


  Currency.fromMap(Map<String,dynamic> map)
  : name=map['name'],
    symbol=map['symbol'],
    priceUSD = map['price_usd'],
    percentChange1h = map['percent_change_1h'],
    percentChange24h = map['percent_change_24h'],
    percentChange7d = map['percent_change_7d'];
}


abstract class ListOfCurrencies {
  Future<List<Currency>> fetchCurrencies();
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}