import 'package:bpm/ControllerProvider/sugerprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LatestBpProvier with ChangeNotifier {
  int _latestSys = 0;
  int _latestDia = 0;
  int _latestPulse = 0;
  int get latestsys => _latestSys;
  int get latestDia => _latestDia;
  int get latestPulse => _latestPulse;

  void setLatestBp({required BuildContext context}) {
    _latestDia=0;
    _latestPulse=0;
    _latestSys=0;
    final sugerProvider = Provider.of<SugerProvider>(context, listen: false);
    for (var item in sugerProvider.sugerProviderList) {
      _latestSys = item.sysTolic;
      _latestDia = item.diasTolic;
      _latestPulse = item.pulse;
    }
    notifyListeners();
  }
}
