import 'dart:io';
import 'class.dart';

Future<Quiz> createQuiz(User user) async {
  print("==============================================================");
  stdout.write("Enter quiz title:");
  String title = stdin.readLineSync()!;
  Quiz quiz = Quiz(title: title, creator: user);

  while (true) {
    stdout.write("Enter question text: ");
    String questionText = stdin.readLineSync()!;

    stdout.write("Enter score for this question: ");
    double score = double.parse(stdin.readLineSync()!);

    stdout
        .write("Enter question type (1 for Single Choice, 2 for Multichoice):");
    Type type =
        (stdin.readLineSync()! == '1') ? Type.SingleChoice : Type.Multichoice;

    List<String> options = [];
    stdout.write("Enter options (comma-separated): ");
    options = stdin.readLineSync()!.split(',');

    if (type == Type.SingleChoice) {
      stdout.write("Enter the correct single choice answer: ");
      String singleChoice = stdin.readLineSync()!;
      quiz.addQuestion(Question(
        questionText: questionText,
        type: type,
        Score: score,
        option: options,
        singleChoice: singleChoice,
      ));
    } else {
      stdout.write(
          "Enter the correct answers (comma-separated for multiple choices): ");
      List<String> multiChoice = stdin.readLineSync()!.split(',');
      quiz.addQuestion(Question(
        questionText: questionText,
        type: type,
        Score: score,
        option: options,
        multiChoice: multiChoice,
      ));
    }

    stdout.write("Add another question? (y/n): ");
    if (stdin.readLineSync()!.toLowerCase() != 'y') {
      break;
    }
  }
  return quiz;
}

Future<void> solveQuizMenu(List<Quiz> quizzes, User user) async {
  if (quizzes.isEmpty) {
    print("No quizzes available.");
    return;
  }
  print("==============================================================");
  print("Available Quizzes:");
  for (var quiz in quizzes) {
    print(
        "${quiz.title} by ${quiz.creator.firstName} ${quiz.creator.lastName}");
  }

  stdout.write("Please enter the title of the quiz you want to solve: ");
  String quizTitle = stdin.readLineSync()!;

  Quiz? quizToSolve = quizzes.firstWhere((quiz) => quiz.title == quizTitle);

  Result result = await solveQuiz(quizToSolve);
  result.username = user.firstName + ' ' + user.lastName;
  result.displayResult();
}

Future<Result> solveQuiz(Quiz quiz) async {
  List<Answer> answers = [];
  print("==============================================================");
  print("Solving quiz: ${quiz.title}");
  for (Question question in quiz.questions) {
    print("==============================================================");
    print("${question.questionText}");
    print("Options: ${question.option.join(', ')}");

    if (question.type == Type.SingleChoice) {
      stdout.write("Enter your answers (If multiChoice comma-separated): ");
      String singleAnswer = stdin.readLineSync()!;
      answers.add(
          Answer(questionId: question.questionId, singleAnswer: singleAnswer));
      if (singleAnswer != question.singleChoice) {
        print("Wrong Answer Correct answer is ${question.singleChoice}");
      }
    } else {
      stdout.write("Enter your answers (If multiChoice comma-separated): ");
      List<String> multipleAnswer = stdin.readLineSync()!.split(', ');
      answers.add(Answer(
          questionId: question.questionId, multipleAnswer: multipleAnswer));
      if (multipleAnswer.toSet().containsAll(question.multiChoice!.toSet())) {
        print(
            "Wrong Answer Correct answer is ${question.multiChoice?.join(",")}");
      }
    }
  }

  Result result = Result(answer: answers, username: '');
  result.checkAnswer(quiz.questions);
  return result;
}
