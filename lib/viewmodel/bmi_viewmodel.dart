import 'package:flutter/material.dart';
import '../model/bmi_model.dart';

class BMIViewModel extends ChangeNotifier {
  final BMIModel _bmiModel = BMIModel();

  bool _isMale = true;
  bool get isMale => _isMale;

  double _height = 170;
  double get height => _height;

  double _weight = 65;
  double get weight => _weight;

  int _age = 25;
  int get age => _age;

  double _bmi = 0;
  double get bmi => _bmi;

  String _bmiCategory = "Normal";
  String get bmiCategory => _bmiCategory;

  void updateGender(bool isMale) {
    _isMale = isMale;
    notifyListeners();
  }

  void updateHeight(double height) {
    _height = height;
    notifyListeners();
  }

  void updateWeight(double weight) {
    _weight = weight;
    notifyListeners();
  }

  void updateAge(double age) {
    _age = age.toInt(); // Ensure age is an integer
    notifyListeners();
  }

  void calculateBMI() {
    _bmi = _bmiModel.calculateBMI(_weight, _height);
    _bmiCategory = _bmiModel.getBMICategory(_bmi);
    notifyListeners();
  }
}
