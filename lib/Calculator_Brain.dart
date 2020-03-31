import 'dart:math';

class Calculator_Brain {
  final int height;
  final int weight;
  double BMI;
  Calculator_Brain({this.height, this.weight});

  double Cal_BMI() {
    BMI = weight / pow(height / 100, 2);
    return BMI;
  }

  String Get_Result() {
    if (BMI >= 25) {
      return 'Overweight';
    }
    if (BMI > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String Get_Messege() {
    if (BMI >= 25) {
      return 'You have higher than normal body weight. Try to exercise more.';
    }
    if (BMI > 18.5) {
      return 'You have normal body weight. Good job!';
    } else {
      return 'You have lower than normal body weight. You can eat a bit more.';
    }
  }
}
