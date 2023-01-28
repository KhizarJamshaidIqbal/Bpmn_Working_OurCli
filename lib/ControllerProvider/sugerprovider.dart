// ignore_for_file: prefer_final_fields

import 'package:bpm/Model/sugercalmodel.dart';
import 'package:flutter/cupertino.dart';

class SugerProvider with ChangeNotifier {
  List _userdatalist = [];

  dynamic get sugerProviderList => _userdatalist;
  void clearlist() {
    _userdatalist.clear();
    notifyListeners();
  }

  void setSugerList(SugerCalculateModel model) {
    _userdatalist.add(model);
    notifyListeners();
  }

  void removeItem(String id) {
    _userdatalist.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}