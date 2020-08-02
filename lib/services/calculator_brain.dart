import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final height;
  final weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return 'Underweight';
    }
  }

  String getInterp() {
    if (_bmi >= 25) {
      return 'You are overweight.';
    } else if (_bmi > 18.5) {
      return "Average Joe";
    } else {
      return 'You are on the skinny side.';
    }
  }
}
