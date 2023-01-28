import 'package:flutter/material.dart';

class TextFieldValueProvider with ChangeNotifier {
  int _mgDlvalue = 0;
  int get getmgDlvalue => _mgDlvalue;
  void setValue({required int mgdlValue}) {
    _mgDlvalue = mgdlValue;
    notifyListeners();
  }
}
