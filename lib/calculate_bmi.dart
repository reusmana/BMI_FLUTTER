import 'dart:math';

class CalculationBrain {
  final int height;
  final int weight;
  double _bmi = 0.0;

  CalculationBrain({required this.height, required this.weight});

  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You Have Higher Than Normal Weight. Try To Exercise More.';
    } else if (_bmi > 18.5) {
      return 'You Have Normal Weight. Good Job!';
    } else {
      return 'You Have Lower Than Normal Weight. You Can Eat More.';
    }
  }
}
