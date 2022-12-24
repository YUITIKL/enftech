import 'package:flutter/cupertino.dart';

class ConcentrationState with ChangeNotifier {
  double _prescription = 0;
  double _concentration = 0;
  double _total = 0;
  bool _click = false;

  double get prescription => this._prescription;
  double get concentration => this._concentration;
  double get total => this._total;
  bool get click => this._click;

  bool get validade =>
      !prescription.isNaN &&
      !concentration.isNaN &&
      prescription != 0 &&
      concentration != 0 &&
      !prescription.isInfinite &&
      !concentration.isInfinite;

  set prescription(double value) {
    this._prescription = value;
    notifyListeners();
  }

  set concentration(double value) {
    this._concentration = value;
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
