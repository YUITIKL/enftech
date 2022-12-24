import 'package:flutter/cupertino.dart';

class SerumState with ChangeNotifier {
  double _prescription = 0;
  double _volume_prescription = 0;
  double _percentage_available = 0;
  double _volume_available = 0;
  double _percentage_ampoule = 0;
  double _volume_ampoule = 0;
  double _serum_available = 0;
  double _serum_concentration = 0;
  double _lack = 0;
  double _amout_ampoule = 0;
  double _add_serum = 0;
  double _total = 0;
  bool _click = false;

  double get prescription => this._prescription;
  double get volume_prescription => this._volume_prescription;
  double get percentage_available => this._percentage_available;
  double get volume_available => this._volume_available;
  double get percentage_ampoule => this._percentage_ampoule;
  double get volume_ampoule => this._volume_ampoule;
  double get serum_available => _serum_available;
  double get serum_concentration => _serum_concentration;
  double get lack => _lack;
  double get amout_ampoule => _amout_ampoule;
  double get add_serum => _add_serum;
  double get total => this._total;
  bool get click => this._click;

  bool get validade =>
      !prescription.isNaN &&
      !volume_prescription.isNaN &&
      prescription != 0 &&
      volume_prescription != 0 &&
      !prescription.isInfinite &&
      !volume_prescription.isInfinite &&
      !percentage_available.isNaN &&
      !volume_available.isNaN &&
      percentage_available != 0 &&
      volume_available != 0 &&
      !percentage_available.isInfinite &&
      !volume_available.isInfinite &&
      !percentage_ampoule.isNaN &&
      !volume_ampoule.isNaN &&
      percentage_ampoule != 0 &&
      volume_ampoule != 0 &&
      !percentage_ampoule.isInfinite &&
      !volume_ampoule.isInfinite;

  set prescription(double value) {
    this._prescription = value;
    notifyListeners();
  }

  set volume_ampoule(double value) {
    this._volume_ampoule = value;
    notifyListeners();
  }

  set percentage_ampoule(double value) {
    this._percentage_ampoule = value;
    notifyListeners();
  }

  set volume_prescription(double value) {
    this._volume_prescription = value;
    notifyListeners();
  }

  set percentage_available(double value) {
    this._percentage_available = value;
    notifyListeners();
  }

  set volume_available(double value) {
    this._volume_available = value;
    notifyListeners();
  }

  set total(double value) {
    this._total = value;
    notifyListeners();
  }

  set serum_available(double value) {
    this._serum_available = value;
    notifyListeners();
  }

  set serum_concentration(double value) {
    this._serum_concentration = value;
    notifyListeners();
  }

  set lack(double value) {
    this._lack = value;
    notifyListeners();
  }

  set amout_ampoule(double value) {
    this._amout_ampoule = value;
    notifyListeners();
  }

  set add_serum(double value) {
    this._add_serum = value;
    notifyListeners();
  }

  set click(bool value) {
    this._click = value;
    notifyListeners();
  }
}
