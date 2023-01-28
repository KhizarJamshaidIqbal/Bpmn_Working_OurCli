import 'package:bpm/ControllerProvider/sugerprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AvgBpProvier with ChangeNotifier {
  double _avgSys = 0;
  double _avgDia = 0;
  double _avgPulse = 0;
  int _avgdivideby = 0;
  double get avgsys => _avgSys;
  double get avgDia => _avgDia;
  double get avgPulse => _avgPulse;
  int get avgdivideby=>_avgdivideby;

  void setAvgBp({required BuildContext context}) {
    final sugerProvider = Provider.of<SugerProvider>(context, listen: false);
    _avgSys=0;
    _avgDia=0;
    _avgPulse=0;
    _avgdivideby=0;
      for (var item in sugerProvider.sugerProviderList) {
        _avgSys = _avgSys + item.sysTolic;
        _avgDia = _avgDia + item.diasTolic;
        _avgPulse = _avgPulse + item.pulse;
        _avgdivideby++;
      }
    notifyListeners();
  }
}
