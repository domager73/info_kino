import 'package:flutter/material.dart';

enum AppThemesEnum { light, dark }

final appThemes = {
  AppThemesEnum.light:
      ThemeData(brightness: Brightness.light, primarySwatch: Colors.orange),
  AppThemesEnum.dark:
      ThemeData(brightness: Brightness.dark, primarySwatch: Colors.amber)
};
