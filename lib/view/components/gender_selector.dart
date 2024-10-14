import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/bmi_viewmodel.dart';

class GenderSelector extends StatelessWidget {
  const GenderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BMIViewModel>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildGenderCard(context, "Male", viewModel.isMale),
        _buildGenderCard(context, "Female", !viewModel.isMale),
      ],
    );
  }

  Widget _buildGenderCard(BuildContext context, String gender, bool isSelected) {
    final viewModel = context.read<BMIViewModel>();

    return Expanded(
      child: GestureDetector(
        onTap: () {
          viewModel.updateGender(gender == "Male");
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10), // Adding margin for spacing
          decoration: BoxDecoration(
            color: isSelected ? Colors.purple.shade400 : Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(
                gender == "Male" ? Icons.male : Icons.female,
                color: isSelected ? Colors.white : Colors.black,
                size: 50,
              ),
              Text(
                gender,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
