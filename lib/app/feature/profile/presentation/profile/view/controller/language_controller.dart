import 'package:flutter/material.dart';

class LanguageController extends ChangeNotifier {
  String language = "en";

  void changeLanguage(String lang) {
    language = lang;
    notifyListeners();
  }
}
