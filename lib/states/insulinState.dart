import 'package:flutter/cupertino.dart';

class InsulinState with ChangeNotifier {
  double _volume = 0;
  double _prescription = 0;
  double _available = 0;
  double _syringe = 0;
  double _medicamento = 0;
  bool _click = false;

  double get volume => this._volume;
  double get prescription => this._prescription;
  double get available => this._available;
  double get syringe => this._syringe;
  double get medicamento => this._medicamento;
  bool get click => this._click;

  bool get validade =>
      !volume.isNaN &&
      !prescription.isNaN &&
      volume != 0 &&
      prescription != 0 &&
      !volume.isInfinite &&
      !prescription.isInfinite &&
      !available.isNaN &&
      !syringe.isNaN &&
      available != 0 &&
      syringe != 0 &&
      !available.isInfinite &&
      !syringe.isInfinite;

  set volume(double value) {
    this._volume = value;
    notifyListeners();
  }

  set prescription(double value) {
    this._prescription = value;
    notifyListeners();
  }

  set available(double value) {
    this._available = value;
    notifyListeners();
  }

  set syringe(double value) {
    this._syringe = value;
    notifyListeners();
  }

  set medicamento(double value) {
    this._medicamento = value;
    notifyListeners();
  }

  set click(bool value) {
    this._click = value;
    notifyListeners();
  }
}
