import 'dart:io';
import 'class.dart';
import 'function.dart';

void main() async {
  const String userFilePath = 'users.json';
  const String quizFilePath = 'quizzes.json';
  List<User> users = await User.loadUsers(userFilePath);
  List<Quiz> quizzes = await Quiz.loadQuizzes(quizFilePath);
  while (true) {
    print("==============================================================");
    print("Welcome to the Quiz App!");
    print("1. Sign Up");
    print("2. Log In");
    print("3. Exit");
    stdout.write("Choose an option: ");

    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        await signUp(users, userFilePath);
        break;

      case '2':
        await logIn(users, quizzes, quizFilePath);
        break;

      case '3':
        print("==============================================================");
        print("Goodbye!");
        return;

      default:
        print("Invalid option, please try again.");
    }
  }
}

Future<void> signUp(List<User> users, String filePath) async {
  stdout.write("Enter your first name: ");
  String firstName = stdin.readLineSync()!;
  stdout.write("Enter your last name: ");
  String lastName = stdin.readLineSync()!;
  stdout.write("Enter a username: ");
  String username = stdin.readLineSync()!;
  stdout.write("Enter a password: ");
  String password = stdin.readLineSync()!;

  User newUser =
      User(firstName, lastName, username: username, password: password);
  await newUser.saveToFile(filePath);
  users.add(newUser);
  print("Sign up successful! You can now log in.");
}

Future<void> logIn(
    List<User> users, List<Quiz> quizzes, String quizFilePath) async {
  print("==============================================================");
  stdout.write("Enter your username: ");
  String username = stdin.readLineSync()!;
  stdout.write("Enter your password: ");
  String password = stdin.readLineSync()!;

  User? loggedInUser =
      users.firstWhere((user) => user.login(username, password));

  print("Login successful! Welcome, ${loggedInUser.firstName}.");
  await userMenu(loggedInUser, quizzes, quizFilePath);
}

Future<void> userMenu(
    User user, List<Quiz> quizzes, String quizFilePath) async {
  print("==============================================================");
  while (true) {
    print("User Menu:");
    print("1. Create a Quiz");
    print("2. Solve a Quiz");
    print("3. Exit to Main Menu");
    stdout.write("Enter a option : ");
    String choice = stdin.readLineSync()!;

    switch (choice) {
      case '1':
        Quiz quiz = await createQuiz(user);
        quizzes.add(quiz);
        await quiz.saveToFile(quizFilePath);
        print("Quiz created successfully!");
        break;

      case '2':
        await solveQuizMenu(quizzes, user);
        break;

      case '3':
        return;

      default:
        print("Invalid option, please try again.");
    }
  }
}
