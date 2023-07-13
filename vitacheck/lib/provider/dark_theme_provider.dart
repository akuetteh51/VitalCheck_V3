
import 'package:flutter/material.dart';
import 'package:vitacheck/provider/Database/dark_theme_perfs.dart';

class DarkThemeProvider extends ChangeNotifier{
ThemePreference Theme_prefer = ThemePreference();

  bool _darktheme =false;
  bool get darktheme =>_darktheme;

 set setdarktheme(bool value){
    _darktheme =value;
    Theme_prefer.setdarkTheme(value);
    notifyListeners();
  }
}