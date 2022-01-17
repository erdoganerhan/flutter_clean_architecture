import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 21, fontWeight: FontWeight.w400)),
      primaryColor: Colors.black,
      splashColor: Colors.transparent,
      fontFamily: 'IBM',
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      cardColor: Colors.white,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
    );
  }

  static ThemeData get dark {
    return ThemeData(
        appBarTheme:
            const AppBarTheme(elevation: 0, backgroundColor: Colors.black),
        primaryColor: Colors.white,
        splashColor: Colors.transparent,
        fontFamily: 'IBM',
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        cardColor: Colors.black,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black);
  }
}
