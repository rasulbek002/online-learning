import 'package:flutter/material.dart';

class ProgressBarAppBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final VoidCallback onBackPressed;

  const ProgressBarAppBar({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    double progress = currentStep / totalSteps;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBackPressed,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 12,
              backgroundColor: Colors.grey[300],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Color(0xFF6949FF),
            ),
          ),
        ),
      ],
    );
  }
}
