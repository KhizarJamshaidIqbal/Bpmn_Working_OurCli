import 'package:flutter/cupertino.dart';

class BottomBarIndexProvider with ChangeNotifier {
  int _currentindex = 0;

  int get bottomIndex => _currentindex;

  void setBottomIndex({required int index}) {
    _currentindex = index;
    notifyListeners();
  }
}
