import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(
      {super.key, required this.onStart, required this.quizTitle});
  final String quizTitle;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/quiz-logo.png", width: 300),
        Text(
          quizTitle,
          style: const TextStyle(
              fontSize: 45, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 40),
        AppButton("Start Quiz", onTap: onStart, icon: Icons.arrow_forward),
      ],
    );
  }
}
