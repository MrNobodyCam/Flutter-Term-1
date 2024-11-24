import 'package:flutter/material.dart';
import 'package:lutter/W7-S1%20PRACTICE/model/quiz.dart';
import 'package:lutter/W7-S1%20PRACTICE/model/submission.dart';
import '../widgets/app_button.dart';

enum CheckResult {
  correct(textColor: Colors.lightGreen, textWeight: FontWeight.bold),
  not_correct(textColor: Colors.red, textWeight: FontWeight.bold);

  final Color textColor;
  final FontWeight textWeight;
  const CheckResult({required this.textColor, required this.textWeight});
}

enum CheckInput {
  correct(textIcon: Icon(Icons.check), iconColor: Colors.black),
  not_correct(textIcon: Icon(Icons.close), iconColor: Colors.blue);

  final Color iconColor;
  final Icon textIcon;
  const CheckInput({required this.iconColor, required this.textIcon});
}

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.onRestart,
      required this.submission,
      required this.quiz});
  final VoidCallback onRestart;
  final Submission submission;
  final Quiz quiz;
  @override
  Widget build(BuildContext context) {
    final score = submission.getScore();
    final totalQuestions = quiz.questions.length;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "You answered $score out of $totalQuestions!",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        ...quiz.questions.asMap().entries.map((entry) {
          final index = entry.key;
          final question = entry.value;
          final answers = entry.value;
          final answer = entry.value;
          final userAnswer =
              submission.getAnswerFor(question)?.questionAnswer ?? '';
          return Correction(
            questionIndex: index + 1,
            quizTitle: question.title,
            answers: answers.possibleAnswers,
            correctAnswer: answer.goodAnswer,
            userAnswer: userAnswer,
          );
        }),
        const SizedBox(height: 30),
        AppButton(
          "Restart Quiz",
          onTap: onRestart,
          icon: Icons.restart_alt,
        ),
      ],
    );
  }
}

class Correction extends StatelessWidget {
  const Correction({
    super.key,
    required this.quizTitle,
    required this.questionIndex,
    required this.answers,
    required this.correctAnswer,
    required this.userAnswer,
  });

  final int questionIndex;
  final String quizTitle;
  final List<String> answers;
  final String correctAnswer;
  final String userAnswer;

  @override
  Widget build(BuildContext context) {
    Color background = Colors.red;
    if (userAnswer == correctAnswer) {
      background = Colors.lightGreen;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              minRadius: 20,
              backgroundColor: background,
              child: Text(
                "$questionIndex",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              quizTitle,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ...answers.map((textAnswer) {
          Color textColor = Colors.black;
          FontWeight textWeight = FontWeight.normal;
          Icon icon = const Icon(Icons.check);
          Color iconColor = Colors.blue;
          if (textAnswer == correctAnswer) {
            textColor = CheckResult.correct.textColor;
            textWeight = CheckResult.correct.textWeight;
            if (userAnswer != textAnswer) {
              textColor = CheckResult.not_correct.textColor;
              textWeight = CheckResult.not_correct.textWeight;
            }
          }
          if (userAnswer == textAnswer) {
            icon = CheckInput.correct.textIcon;
            iconColor = CheckInput.correct.iconColor;
          }
          // else if (userAnswer != textAnswer) {
          //   textColor = CheckResult.not_correct.textColor;
          //   textWeight = CheckResult.not_correct.textWeight;
          // }

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon.icon, color: iconColor),
              const SizedBox(width: 10),
              Text(
                textAnswer,
                style: TextStyle(
                  fontSize: 20,
                  color: textColor,
                  fontWeight: textWeight,
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
