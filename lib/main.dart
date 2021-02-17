import 'package:bml_calculator/constants.dart';
import 'package:bml_calculator/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0A0321),
        scaffoldBackgroundColor: kAInactiveCardColor 
      ),
    );
  }
}