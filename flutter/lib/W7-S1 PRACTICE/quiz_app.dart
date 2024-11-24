import 'package:flutter/material.dart';
import 'package:lutter/W7-S1%20PRACTICE/screens/question_screen.dart';
import 'package:lutter/W7-S1%20PRACTICE/screens/result_screen.dart';
import 'package:lutter/W7-S1%20PRACTICE/screens/welcome_screen.dart';
import 'model/quiz.dart';
import 'model/submission.dart';

enum QuizState { not_started, started, finished }

Color appColor = Colors.blue[500] as Color;

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState _currentQuizState = QuizState.not_started;
  final Submission _submission = Submission();
  int _currentQuestionIndex = 0;

  void startQuiz() {
    setState(() {
      _submission.removeAnswers();
      _currentQuestionIndex = 0;
      _currentQuizState = QuizState.started;
    });
  }

  void answerQuestion(String answerText) {
    final currentQuestion = widget.quiz.questions[_currentQuestionIndex];
    _submission.addAnswer(currentQuestion, answerText);

    setState(() {
      if (_currentQuestionIndex < widget.quiz.questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _currentQuizState = QuizState.finished;
      }
    });
  }

  void restartQuiz() {
    setState(() {
      _submission.removeAnswers();
      _currentQuizState = QuizState.not_started;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;

    switch (_currentQuizState) {
      case QuizState.not_started:
        screen =
            WelcomeScreen(onStart: startQuiz, quizTitle: widget.quiz.title);
        break;

      case QuizState.started:
        screen = QuestionScreen(
          question: widget.quiz.questions[_currentQuestionIndex],
          onAnswerSelected: answerQuestion,
        );
        break;

      case QuizState.finished:
        screen = ResultScreen(
          onRestart: restartQuiz,
          submission: _submission,
          quiz: widget.quiz,
        );
        break;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(
          child: screen,
        ),
      ),
    );
  }
}
