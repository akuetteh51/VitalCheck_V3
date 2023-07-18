import 'package:flutter/material.dart';
import 'package:vitacheck/provider/Database/theme_preferences.dart';

class DarkThemeProvider extends ChangeNotifier {
  ThemePreference Theme_prefer = ThemePreference();

  bool _darktheme = false;
  bool get darktheme => _darktheme;

  set setdarktheme(bool value) {
    _darktheme = value;
    Theme_prefer.setTheme(value);
    notifyListeners();
  }
}
