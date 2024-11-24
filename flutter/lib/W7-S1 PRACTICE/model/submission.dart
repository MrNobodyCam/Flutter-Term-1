import 'quiz.dart';

class Answer {
  final String questionAnswer;
  final bool correct;
  Answer({required this.questionAnswer, required this.correct});

  bool isCorrect(Question question) => question.goodAnswer == questionAnswer;
}

class Submission {
  final Map<Question, Answer> _answers = {};

  int getScore() {
    int score = 0;
    for (Question q in _answers.keys) {
      Answer? answer = _answers[q] as Answer;
      score += answer.isCorrect(q) ? 1 : 0;
    }
    return score;
  }

  Answer? getAnswerFor(Question question) {
    return _answers[question];
  }

  void addAnswer(Question question, String answerText) {
    final isCorrect = _checkAnswer(question, answerText);
    _answers[question] = Answer(questionAnswer: answerText, correct: isCorrect);
  }

  void removeAnswers() {
    _answers.clear();
  }

  bool _checkAnswer(Question question, String answerText) {
    return answerText.toLowerCase() == "correct";
  }
}
