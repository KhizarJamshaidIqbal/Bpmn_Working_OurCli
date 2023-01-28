import 'package:bpm/ControllerProvider/sugerprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MaxBpProvier with ChangeNotifier {
  int _maxSys = 0;
  int _maxDia = 0;
  int _maxPulse = 0;
  int get maxsys => _maxSys;
  int get maxDia => _maxDia;
  int get maxPulse => _maxPulse;

  void setMaxBp({required BuildContext context}) {
    _maxDia=0;
    _maxPulse=0;
    _maxSys=0;
    final sugerProvider = Provider.of<SugerProvider>(context, listen: false);
    for (var item in sugerProvider.sugerProviderList) {
      if (item.sysTolic > maxsys) {
        _maxSys = item.sysTolic;
      }
      if (item.diasTolic > _maxDia) {
        _maxDia = item.diasTolic;
      }
      if (item.pulse > _maxPulse) {
        _maxPulse = item.pulse;
      }
    }
    notifyListeners();
  }
}
