import 'package:bpm/ControllerProvider/sugerprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MinBpProvier with ChangeNotifier {
  int _minSys = 0;
  int _minDia = 0;
  int _minPulse = 0;
  int get minsys => _minSys;
  int get minDia => _minDia;
  int get minPulse => _minPulse;

  void setMinBp({required BuildContext context}) {
    _minDia = 0;
    _minPulse = 0;
    _minSys = 0;
    var syslist = [];
    var dialist = [];
    var pulselist = [];
    final sugerProvider = Provider.of<SugerProvider>(context, listen: false);
    if (sugerProvider.sugerProviderList.length > 0) {
      for (var item in sugerProvider.sugerProviderList) {
        syslist.add(item.sysTolic);
        dialist.add(item.diasTolic);
        pulselist.add(item.pulse);
      }
      syslist.sort();
      dialist.sort();
      pulselist.sort();
      _minSys = syslist[0];
      _minDia = dialist[0];
      _minPulse = pulselist[0];
    }
    notifyListeners();
  }
}
