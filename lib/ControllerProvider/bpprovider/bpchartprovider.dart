// ignore_for_file: unused_field, prefer_final_fields, unused_local_variable
import 'package:bpm/ControllerProvider/sugerprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BpChartProvider with ChangeNotifier {
  int _monChartVSys = 0,
      _tueChartVSys = 0,
      _wedChartVSys = 0,
      _thurChartVSys = 0,
      _friChartVSys = 0,
      _satChartVSys = 0,
      _sunChartVSys = 0;
  int _monChartVDia = 0,
      _tueChartVDia = 0,
      _wedChartVDia = 0,
      _thurChartVDia = 0,
      _friChartVDia = 0,
      _satChartVDia = 0,
      _sunChartVDia = 0;
  int get monchartVSys => _monChartVSys;
  int get tuechartVSys => _tueChartVSys;
  int get wedchartVSys => _wedChartVSys;
  int get thurchartVSys => _thurChartVSys;
  int get fridaychartVSys => _friChartVSys;
  int get satchartVSys => _satChartVSys;
  int get sunchartVSys => _sunChartVSys;
  int get monChartVDia => _monChartVDia;
  int get tuechartVDia => _tueChartVDia;
  int get wedchartVDia => _wedChartVDia;
  int get thurchartVDia => _thurChartVDia;
  int get fridaychartVDia => _friChartVDia;
  int get satchartVDia => _satChartVDia;
  int get sunchartVDia => _sunChartVDia;

  int currentMonthValue = 0;
  var _janSysList = [];
  var _janDiaList = [];
  var _febSysList = [];
  var _febDiaList = [];
  var _marSysList = [];
  var _marDiaList = [];
  var _aprSysList = [];
  var _aprDiaList = [];
  var _maySysList = [];
  var _mayDiaList = [];
  var _junSysList = [];
  var _junDiaList = [];
  var _julSysList = [];
  var _julDiaList = [];
  var _augSysList = [];
  var _augDiaList = [];
  var _sepSysList = [];
  var _sepDiaList = [];
  var _octSysList = [];
  var _octDiaList = [];
  var _novSysList = [];
  var _novDiaList = [];
  var _decSysList = [];
  var _decDiaList = [];
  List get janSysList => _janSysList;
  List get janDiaList => _janDiaList;
  List get febSysList => _febSysList;
  List get febDiaList => _febDiaList;
  List get marSysList => _marSysList;
  List get marDiaList => _marDiaList;
  List get aprSysList => _aprSysList;
  List get aprDiaList => _aprDiaList;
  List get maySysList => _maySysList;
  List get mayDiaList => _mayDiaList;
  List get junSysList => _junSysList;
  List get junDiaList => _junDiaList;
  List get julSysList => _julSysList;
  List get julDiaList => _julDiaList;
  List get augSysList => _augSysList;
  List get augDiaList => _augDiaList;
  List get sepSysList => _sepSysList;
  List get sepDiaList => _sepDiaList;
  List get octSysList => _octSysList;
  List get octDiaList => _octDiaList;
  List get novSysList => _novSysList;
  List get novDiaList => _novDiaList;
  List get decSysList => _decSysList;
  List get decDiaList => _decDiaList;

  void setChart(BuildContext context) {
    _monChartVSys = 0;
    _tueChartVSys = 0;
    _wedChartVSys = 0;
    _thurChartVSys = 0;
    _friChartVSys = 0;
    _satChartVSys = 0;
    _sunChartVSys = 0;
    _monChartVDia = 0;
    _tueChartVDia = 0;
    _wedChartVDia = 0;
    _thurChartVDia = 0;
    _friChartVDia = 0;
    _satChartVDia = 0;
    _sunChartVDia = 0;
    currentMonthValue = 0;
    _janSysList.clear();
    _janDiaList.clear();
    _febSysList.clear();
    _febDiaList.clear();
    _marSysList.clear();
    _marDiaList.clear();
    _aprSysList.clear();
    _aprDiaList.clear();
    _maySysList.clear();
    _mayDiaList.clear();
    _junSysList.clear();
    _junDiaList.clear();
    _julSysList.clear();
    _julDiaList.clear();
    _augSysList.clear();
    _augDiaList.clear();
    _sepSysList.clear();
    _sepDiaList.clear();
    _octSysList.clear();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    final sugerProvider = Provider.of<SugerProvider>(context, listen: false);
    int recordCounter = 0;
    _novDiaList.clear();
    for (var index = sugerProvider.sugerProviderList.length - 1;
        index >= 0;
        index--) {
      String date = sugerProvider.sugerProviderList[index].date;
      DateTime parseDate = DateTime.parse(date);
      currentMonthValue = parseDate.month;
      if (currentMonthValue == 1) {
        janSysList.add(sugerProvider.sugerProviderList[index].sysTolic);
        janDiaList.add(sugerProvider.sugerProviderList[index].diasTolic);
      } else if (currentMonthValue == 2) {
        febSysList.add(sugerProvider.sugerProviderList[index].sysTolic);
        febDiaList.add(sugerProvider.sugerProviderList[index].diasTolic);
      } else if (currentMonthValue == 3) {
        marSysList.add(sugerProvider.sugerProviderList[index].sysTolic);
        marDiaList.add(sugerProvider.sugerProviderList[index].diasTolic);
      } else if (currentMonthValue == 4) {
        aprSysList.add(sugerProvider.sugerProviderList[index].sysTolic);
        aprDiaList.add(sugerProvider.sugerProviderList[index].diasTolic);
      } else if (currentMonthValue == 5) {
        maySysList.add(sugerProvider.sugerProviderList[index].sysTolic);
        mayDiaList.add(sugerProvider.sugerProviderList[index].diasTolic);
      } else if (currentMonthValue == 6) {
        junSysList.add(sugerProvider.sugerProviderList[index].sysTolic);
        junDiaList.add(sugerProvider.sugerProviderList[index].diasTolic);
      } else if (currentMonthValue == 7) {
        julSysList.add(sugerProvider.sugerProviderList[index].sysTolic);
        julDiaList.add(sugerProvider.sugerProviderList[index].diasTolic);
      } else if (currentMonthValue == 8) {
        augSysList.add(sugerProvider.sugerProviderList[index].sysTolic);
        augDiaList.add(sugerProvider.sugerProviderList[index].diasTolic);
      } else if (currentMonthValue == 9) {
        sepSysList.add(sugerProvider.sugerProviderList[index].sysTolic);
        sepDiaList.add(sugerProvider.sugerProviderList[index].diasTolic);
      } else if (currentMonthValue == 10) {
        octSysList.add(sugerProvider.sugerProviderList[index].sysTolic);
        octDiaList.add(sugerProvider.sugerProviderList[index].diasTolic);
      } else if (currentMonthValue == 11) {
        novSysList.add(sugerProvider.sugerProviderList[index].sysTolic);
        novDiaList.add(sugerProvider.sugerProviderList[index].diasTolic);
      } else if (currentMonthValue == 12) {
        decSysList.add(sugerProvider.sugerProviderList[index].sysTolic);
        decDiaList.add(sugerProvider.sugerProviderList[index].diasTolic);
      }
      if (recordCounter <= 7) {
        if (parseDate.weekday == 1) {
          _monChartVSys = sugerProvider.sugerProviderList[index].sysTolic;
          _monChartVDia = sugerProvider.sugerProviderList[index].diasTolic;
        } else if (parseDate.weekday == 2) {
          _tueChartVSys = sugerProvider.sugerProviderList[index].sysTolic;
          _tueChartVDia = sugerProvider.sugerProviderList[index].diasTolic;
        } else if (parseDate.weekday == 3) {
          _wedChartVSys = sugerProvider.sugerProviderList[index].sysTolic;
          _wedChartVDia = sugerProvider.sugerProviderList[index].diasTolic;
        } else if (parseDate.weekday == 4) {
          _thurChartVSys = sugerProvider.sugerProviderList[index].sysTolic;
          _thurChartVDia = sugerProvider.sugerProviderList[index].diasTolic;
        } else if (parseDate.weekday == 5) {
          _friChartVSys = sugerProvider.sugerProviderList[index].sysTolic;
          _friChartVDia = sugerProvider.sugerProviderList[index].diasTolic;
        } else if (parseDate.weekday == 6) {
          _satChartVSys = sugerProvider.sugerProviderList[index].sysTolic;
          _satChartVDia = sugerProvider.sugerProviderList[index].diasTolic;
        } else if (parseDate.weekday == 7) {
          _sunChartVSys = sugerProvider.sugerProviderList[index].sysTolic;
          _sunChartVDia = sugerProvider.sugerProviderList[index].diasTolic;
        }
      }
      // else {
      //   break;
      // }
      notifyListeners();
      recordCounter++;
    }
  }
}
