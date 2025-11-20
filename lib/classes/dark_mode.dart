import 'package:flutter/material.dart';

class DarkMode extends ChangeNotifier {

  bool _dark_mode = false;

  set darkMode(bool value){
    _dark_mode = value;
    notifyListeners();
  }
  
  bool get darkMode => _dark_mode;
  
}