import 'package:flutter/cupertino.dart';

class BabyState with ChangeNotifier {
  double _volume = 0;
  double _concentration = 0;
  double _dose = 0;
  double _peso = 0;
  double _medicamento = 0;
  bool _click = false;

  double get volume => this._volume;
  double get concentration => this._concentration;
  double get dose => this._dose;
  double get peso => this._peso;
  double get medicamento => this._medicamento;
  bool get click => this._click;

  bool get validade =>
      !volume.isNaN &&
      !concentration.isNaN &&
      volume != 0 &&
      concentration != 0 &&
      !volume.isInfinite &&
      !concentration.isInfinite &&
      !dose.isNaN &&
      !peso.isNaN &&
      dose != 0 &&
      peso != 0 &&
      !dose.isInfinite &&
      !peso.isInfinite;

  set volume(double value) {
    this._volume = value;
    notifyListeners();
  }

  set concentration(double value) {
    this._concentration = value;
    notifyListeners();
  }

  set dose(double value) {
    this._dose = value;
    notifyListeners();
  }

  set peso(double value) {
    this._peso = value;
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
