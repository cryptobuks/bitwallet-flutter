// Model class for the currency
class Currency {
  String name;
  String priceUSD;
  String percentChange1h;

  Currency({this.name, this.priceUSD, this.percentChange1h}); //Constructor


  Currency.fromMap(Map<String,dynamic> map)
  : name=map['name'],
    priceUSD = map['price_usd'],
    percentChange1h = map['percent_change_1h'];
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