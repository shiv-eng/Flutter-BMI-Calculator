import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/bmi_viewmodel.dart';

class WeightAndAgeSelector extends StatelessWidget {
  const WeightAndAgeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BMIViewModel>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildCounterCard(context, "Weight", viewModel.weight, viewModel.updateWeight, isAge: false),
        _buildCounterCard(context, "Age", viewModel.age.toDouble(), viewModel.updateAge, isAge: true),
      ],
    );
  }

  Widget _buildCounterCard(BuildContext context, String label, double value, Function(double) onChanged, {required bool isAge}) {
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
          Text(
            label,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            isAge ? value.toInt().toString() : value.toStringAsFixed(1),
            style: const TextStyle(fontSize: 36, color: Colors.purple),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () => onChanged(isAge ? value - 1 : value - 0.1),
                icon: const Icon(Icons.remove),
                color: Colors.purple,
              ),
              IconButton(
                onPressed: () => onChanged(isAge ? value + 1 : value + 0.1),
                icon: const Icon(Icons.add),
                color: Colors.purple,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
