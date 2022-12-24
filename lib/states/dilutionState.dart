import 'package:flutter/cupertino.dart';

class DilutionState with ChangeNotifier {
  double _volume = 0;
  double _prescription = 0;
  double _concentration = 0;
  double _solvent = 0;
  double _medicamento0 = 0;
  double _medicamento1 = 0;
  bool _click = false;

  double get volume => this._volume;
  double get prescription => this._prescription;
  double get concentration => this._concentration;
  double get solvent => this._solvent;
  double get medicamento0 => this._medicamento0;
  double get medicamento1 => this._medicamento1;
  bool get click => this._click;

  bool get validade =>
      !volume.isNaN &&
      !prescription.isNaN &&
      volume != 0 &&
      prescription != 0 &&
      !volume.isInfinite &&
      !prescription.isInfinite &&
      !concentration.isNaN &&
      !solvent.isNaN &&
      concentration != 0 &&
      solvent != 0 &&
      !concentration.isInfinite &&
      !solvent.isInfinite;

  set volume(double value) {
    this._volume = value;
    notifyListeners();
  }

  set prescription(double value) {
    this._prescription = value;
    notifyListeners();
  }

  set concentration(double value) {
    this._concentration = value;
    notifyListeners();
  }

  set solvent(double value) {
    this._solvent = value;
    notifyListeners();
  }

  set medicamento0(double value) {
    this._medicamento0 = value;
    notifyListeners();
  }

  set medicamento1(double value) {
    this._medicamento1 = value;
    notifyListeners();
  }

  set click(bool value) {
    this._click = value;
    notifyListeners();
  }
}
