import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel/bmi_viewmodel.dart';
import 'view/bmi_calculator_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BMIViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.grey[900],
      ),
      home: const BMICalculatorScreen(),
    );
  }
}
