import 'package:flutter/material.dart';

class Colors {

  const Colors();


  static const Color appBarTitle = const Color(0xFFFFFFFF);
  static const Color appBarIconColor = const Color(0xFFFFFFFF);
  static const Color appBarDetailBackground = const Color(0x00FFFFFF);
  static const Color appBarGradientStart = const Color(0xFF2e3440);
  static const Color appBarGradientEnd = const Color(0xFF3b4252);

  //static const Color currencyCard = const Color(0xFF434273);
  static const Color currencyCard = const Color(0xFF3b4252);
  //static const Color currencyListBackground = const Color(0xFF3E3963);
  static const Color currencyPageBackground = const Color(0xFF4c566a);
  static const Color currencyTitle = const Color(0xFFFFFFFF);
  static const Color currencyPercentUp = const Color(0xFFa3be8c);
  static const Color currencyPercentDown = const Color(0xFFbf616a);
}

class Dimens {
  const Dimens();

  static const currencyWidth = 75.0;
  static const currencyHeight = 75.0;
}

class TextStyles {

  const TextStyles();

  static const TextStyle appBarTitle = const TextStyle(
    color: Colors.appBarTitle,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 36.0
  );

  static const TextStyle currencyTitle = const TextStyle(
    color: Colors.currencyTitle,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 24.0
  );

}