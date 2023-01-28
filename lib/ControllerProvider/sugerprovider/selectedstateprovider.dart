import 'package:flutter/cupertino.dart';

class SelectedSateProvider with ChangeNotifier {
  String _stateName = "Default";
  int _mgDlvalue = 0;
  String get getStateName => _stateName;
  int get getmgDlvalue => _mgDlvalue;
  // int get getid => _id;
  void setSelectedState({required String stateName, required int mgDlvalue}) {
    _stateName = stateName;
    _mgDlvalue = mgDlvalue;

    notifyListeners();
  }
}
