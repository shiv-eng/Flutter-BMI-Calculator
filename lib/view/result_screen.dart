import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/bmi_viewmodel.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BMIViewModel>();

    Color categoryColor;
    String categoryMessage;

    switch (viewModel.bmiCategory) {
      case "Normal":
        categoryMessage = "You have a normal weight.";
        categoryColor = Colors.green;
        break;
      case "Underweight":
        categoryMessage = "You are underweight.";
        categoryColor = Colors.yellow;
        break;
      case "Overweight":
        categoryMessage = "You are overweight.";
        categoryColor = Colors.deepOrangeAccent;
        break;
      default:
        categoryMessage = "You are classified as obese.";
        categoryColor = Colors.red;
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI RESULT"),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade300, Colors.blue.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: viewModel.bmi),
            duration: const Duration(seconds: 1),
            builder: (context, value, child) {
              return Container(
                width: 350,
                height: 450,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Your BMI",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      value.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      categoryMessage,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: categoryColor, 
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      child: const Text("RE-CALCULATE"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
