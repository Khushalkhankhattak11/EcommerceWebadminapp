import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{


  ThemeMode ThemeModes = ThemeMode.dark;
  Future<void> changeTheme(ThemeMode mode)async{
    ThemeModes =mode;
    notifyListeners();
  }
}