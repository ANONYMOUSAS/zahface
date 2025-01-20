import 'package:flutter/material.dart';

import 'theme.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData _themeData = MaterialTheme(TextTheme()).light();

  ThemeData get themeData => _themeData;

  void setTheme(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

}