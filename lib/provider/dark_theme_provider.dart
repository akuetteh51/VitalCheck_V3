
import 'package:flutter/material.dart';

class DarkThemeProvider extends ChangeNotifier{

  bool _darktheme =false;
  bool get darktheme =>_darktheme;

  setdarktheme(bool value){
    _darktheme =value;
    notifyListeners();
  }
}