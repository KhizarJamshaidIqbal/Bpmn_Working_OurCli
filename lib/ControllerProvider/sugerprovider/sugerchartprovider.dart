// ignore_for_file: unused_field, prefer_final_fields, unused_local_variable
import 'package:bpm/ControllerProvider/sugerprovider/sugervalueprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SugerChartProvider with ChangeNotifier {
  int _monChartV = 0,
      _tueChartV = 0,
      _wedChartV = 0,
      _thurChartV = 0,
      _friChartV = 0,
      _satChartV = 0,
      _sunChartV = 0;
  int get monchartV => _monChartV;
  int get tuechartV => _tueChartV;
  int get wedchartV => _wedChartV;
  int get thurchartV => _thurChartV;
  int get fridaychartV => _friChartV;
  int get satchartV => _satChartV;
  int get sunchartV => _sunChartV;

  int currentMonthValue = 0;
  var _janSugerMonthValue = [];
  var _febSugerMonthValue = [];
  var _marSugerMonthValue = [];
  var _aprSugerMonthValue = [];
  var _maySugerMonthValue = [];
  var _junSugerMonthValue = [];
  var _julSugerMonthValue = [];
  var _augSugerMonthValue = [];
  var _sepSugerMonthValue = [];
  var _octSugerMonthValue = [];
  var _novSugerMonthValue = [];
  var _decSugerMonthValue = [];
  List get janSugerMonthValue => _janSugerMonthValue;
  List get febSugerMonthValue => _febSugerMonthValue;
  List get marSugerMonthValue => _marSugerMonthValue;
  List get aprSugerMonthValue => _aprSugerMonthValue;
  List get maySugerMonthValue => _maySugerMonthValue;
  List get junSugerMonthValue => _junSugerMonthValue;
  List get julSugerMonthValue => _julSugerMonthValue;
  List get augSugerMonthValue => _augSugerMonthValue;
  List get sepSugerMonthValue => _sepSugerMonthValue;
  List get octSugerMonthValue => _octSugerMonthValue;
  List get novSugerMonthValue => _novSugerMonthValue;
  List get decSugerMonthValue => _decSugerMonthValue;

  void setChart(BuildContext context) {
    _monChartV = 0;
    _tueChartV = 0;
    _wedChartV = 0;
    _thurChartV = 0;
    _friChartV = 0;
    _satChartV = 0;
    _sunChartV = 0;
    _janSugerMonthValue.clear();
    _febSugerMonthValue.clear();
    _marSugerMonthValue.clear();
    _aprSugerMonthValue.clear();
    _maySugerMonthValue.clear();
    _junSugerMonthValue.clear();
    _julSugerMonthValue.clear();
    _augSugerMonthValue.clear();
    _sepSugerMonthValue.clear();
    _octSugerMonthValue.clear();
    _novSugerMonthValue.clear();
    _decSugerMonthValue.clear();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    final sugerProvider =
        Provider.of<SugerValueProvider>(context, listen: false);
    int recordCounter = 0;
    for (var index = sugerProvider.sugerProviderList.length - 1;
        index >= 0;
        index--) {
      String date = sugerProvider.sugerProviderList[index].date;
      DateTime parseDate = DateTime.parse(date);
      currentMonthValue = parseDate.month;
      if (currentMonthValue == 1) {
        _janSugerMonthValue.add(sugerProvider.sugerProviderList[index].mgddl);
      } else if (currentMonthValue == 2) {
        _febSugerMonthValue.add(sugerProvider.sugerProviderList[index].mgddl);
      } else if (currentMonthValue == 3) {
        _marSugerMonthValue.add(sugerProvider.sugerProviderList[index].mgddl);
      } else if (currentMonthValue == 4) {
        _aprSugerMonthValue.add(sugerProvider.sugerProviderList[index].mgddl);
      } else if (currentMonthValue == 5) {
        _maySugerMonthValue.add(sugerProvider.sugerProviderList[index].mgddl);
      } else if (currentMonthValue == 6) {
        _junSugerMonthValue.add(sugerProvider.sugerProviderList[index].mgddl);
      } else if (currentMonthValue == 7) {
        _julSugerMonthValue.add(sugerProvider.sugerProviderList[index].mgddl);
      } else if (currentMonthValue == 8) {
        _augSugerMonthValue.add(sugerProvider.sugerProviderList[index].mgddl);
      } else if (currentMonthValue == 9) {
        _sepSugerMonthValue.add(sugerProvider.sugerProviderList[index].mgddl);
      } else if (currentMonthValue == 10) {
        _octSugerMonthValue.add(sugerProvider.sugerProviderList[index].mgddl);
      } else if (currentMonthValue == 12) {
        _novSugerMonthValue.add(sugerProvider.sugerProviderList[index].mgddl);
      }
      if (recordCounter <= 7) {
        if (parseDate.weekday == 1) {
          _monChartV = sugerProvider.sugerProviderList[index].mgddl;
        } else if (parseDate.weekday == 2) {
          _tueChartV = sugerProvider.sugerProviderList[index].mgddl;
        } else if (parseDate.weekday == 3) {
          _wedChartV = sugerProvider.sugerProviderList[index].mgddl;
        } else if (parseDate.weekday == 4) {
          _thurChartV = sugerProvider.sugerProviderList[index].mgddl;
        } else if (parseDate.weekday == 5) {
          _friChartV = sugerProvider.sugerProviderList[index].mgddl;
        } else if (parseDate.weekday == 6) {
          _satChartV = sugerProvider.sugerProviderList[index].mgddl;
        } else if (parseDate.weekday == 7) {
          _sunChartV = sugerProvider.sugerProviderList[index].mgddl;
        }
      }
      notifyListeners();
      recordCounter++;
    }
  }
}
