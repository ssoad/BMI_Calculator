import 'package:flutter/material.dart';

import 'Input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primaryColor: Color(0xFF000d1a),
        accentColor: Color(0xFFff1a75),
        scaffoldBackgroundColor: Color(0xFF000d1a),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.white,
          ),
          body2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: Input_page(),
    );
  }
}
