import 'package:flutter/foundation.dart';

class GenderController extends ChangeNotifier {
  String gender = '';

  void initGender(String val) {
    gender = val;
    notifyListeners();
  }

  void changeGender(String val) {
    gender = val;
    notifyListeners();
  }
}
