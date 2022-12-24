import 'package:flutter/cupertino.dart';

class DripState with ChangeNotifier {
  double _volume = 0;
  double _time = 0;
  double _microgodas = 0;
  double _macrogotas = 0;
  bool _click = false;

  double get volume => this._volume;
  double get time => this._time;
  double get microgodas => this._microgodas;
  double get macrogotas => this._macrogotas;
  bool get click => this._click;

  bool get validade =>
      !volume.isNaN &&
      !time.isNaN &&
      volume != 0 &&
      time != 0 &&
      !volume.isInfinite &&
      !time.isInfinite;

  set volume(double value) {
    this._volume = value;
    notifyListeners();
  }

  set time(double value) {
    this._time = value;
    notifyListeners();
  }

  set microgodas(double value) {
    this._microgodas = value;
    notifyListeners();
  }

  set macrogotas(double value) {
    this._macrogotas = value;
    notifyListeners();
  }

  set click(bool value) {
    this._click = value;
    notifyListeners();
  }
}
