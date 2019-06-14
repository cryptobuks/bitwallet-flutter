
import 'package:bitwallet/data/currency.dart';
import 'package:bitwallet/data/dependency_injection.dart';

abstract class CurrencyListViewContract {
  void onLoadComplete(List<Currency> currencies);
  void onLoadError();
}

class CurrencyListPresenter {
  CurrencyListViewContract _view;
  ListOfCurrencies _currencyList;

  CurrencyListPresenter(this._view){
    _currencyList = new Injector().currencyList;
  }

  void getCurrencies(){
    _currencyList
        .fetchCurrencies()   //Load currencies from production or test list
        .then((c)=>_view.onLoadComplete(c))
        .catchError((onError)=>_view.onLoadError());
  }
} 