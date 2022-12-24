import 'package:flutter/cupertino.dart';

class RuleState with ChangeNotifier {
  double _volume = 0;
  double _prescription = 0;
  double _disponivel = 0;
  double _total = 0;
  bool _click = false;

  double get volume => this._volume;
  double get prescription => this._prescription;
  double get disponivel => this._disponivel;
  double get total => this._total;
  bool get click => this._click;

  bool get validade =>
      !volume.isNaN &&
      !prescription.isNaN &&
      volume != 0 &&
      prescription != 0 &&
      !volume.isInfinite &&
      !prescription.isInfinite &&
      !disponivel.isNaN &&
      disponivel != 0 &&
      !disponivel.isInfinite;

  set volume(double value) {
    this._volume = value;
    notifyListeners();
  }

  set prescription(double value) {
    this._prescription = value;
    notifyListeners();
  }

  set disponivel(double value) {
    this._disponivel = value;
    notifyListeners();
  }

  set total(double value) {
    this._total = value;
    notifyListeners();
  }

  set click(bool value) {
    this._click = value;
    notifyListeners();
  }
}
