// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class bpSelectedValuesProvider with ChangeNotifier {
  int _selectedItemIndexSys = 0;
  int _selectedItemIndexDia = 0;
  int _selectedItemIndexPulse = 0;

  int get getSelectedItemIndexSys => _selectedItemIndexSys;
  int get getSelectedItemIndexDia => _selectedItemIndexDia;
  int get getselectedItemIndexPulse => _selectedItemIndexPulse;
  void setSelectedItemIndexSys({required int sys}) {
    _selectedItemIndexSys = sys;
    notifyListeners();
  }
  void setSelectedItemIndexDia({required int dia}) {
    _selectedItemIndexDia=dia;
    notifyListeners();
  }
  void setSelectedItemIndexPulse({required int pulse}) {
    _selectedItemIndexPulse=pulse;
    notifyListeners();
  }
}
