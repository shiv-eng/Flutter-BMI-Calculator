import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/bmi_viewmodel.dart';

class HeightSelector extends StatelessWidget {
  const HeightSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BMIViewModel>();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "Height",
            style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            "${viewModel.height.toStringAsFixed(0)} cm",
            style: const TextStyle(fontSize: 24, color: Colors.purple),
          ),
          Slider(
            value: viewModel.height,
            min: 100,
            max: 220,
            activeColor: Colors.purple,
            onChanged: (value) {
              viewModel.updateHeight(value);
            },
          ),
        ],
      ),
    );
  }
}
