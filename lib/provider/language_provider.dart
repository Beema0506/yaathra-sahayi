import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  bool _isMalayalam = false;
  bool get isMalayalam  => _isMalayalam;

  void toggleLanguage(){
    _isMalayalam = !_isMalayalam;
    notifyListeners();
  }

  void setLanguage(bool malayalam){
    _isMalayalam = malayalam;
    notifyListeners();
  }


}