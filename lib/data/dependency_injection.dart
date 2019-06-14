// Use Flavors to define and switch between build configuration,
// i.e. one for development and one for production
import 'package:bitwallet/data/TestCurrencyDataRetriever.dart';
import 'package:bitwallet/data/currency.dart';
import 'package:bitwallet/data/currencyDataRetriever.dart';

enum Flavor {Test, Production} 


class Injector {
  // Singleton is a design pattern which stands for having only one instance of some class
  // during the whole application lifetime

  // Since the currency data is going to be used everywhere, the dependency is suitable to be extracted
  // Everywhere and used as a singleton
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  // Method to set the flavor (the environment or build config)
  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  ListOfCurrencies get currencyList {
    switch(_flavor) {
      case Flavor.Test:
        return new TestCurrencyDataRetriever();
      default: 
        return new CurrencyDataRetriever();
    }
  }

}