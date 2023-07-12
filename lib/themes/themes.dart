import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.orange,
    cardColor: Colors.yellow,
    appBarTheme: const AppBarTheme(color: Colors.orange),
  );
  static final darkTheme =
      ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.amber,
          appBarTheme: const AppBarTheme(color: Colors.black12),
          cardColor: Colors.amber[100]
      );
}
