import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/bmi_viewmodel.dart';
import 'components/gender_selector.dart';
import 'components/height_selector.dart';
import 'components/weight_and_age_selector.dart';
import 'result_screen.dart';

class BMICalculatorScreen extends StatelessWidget {
  const BMICalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade300, Colors.blue.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60),
              const Text(
                "BMI Calculator",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 40),
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GenderSelector(),
                      SizedBox(height: 20),
                      HeightSelector(),
                      SizedBox(height: 20),
                      WeightAndAgeSelector(),
                    ],
                  ),
                ),
              ),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.8, end: 1),
                duration: const Duration(milliseconds: 500),
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: 
                    ElevatedButton(
  onPressed: () {
    context.read<BMIViewModel>().calculateBMI();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ResultScreen(),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.purple,
    padding: const EdgeInsets.symmetric(vertical: 20),
    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  child: const Text("CALCULATE"),
),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
