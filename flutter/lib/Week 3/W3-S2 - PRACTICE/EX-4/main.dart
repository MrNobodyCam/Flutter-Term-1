import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  const myButton({super.key, this.text = "hello", this.start, this.end});
  final String text;
  final Color? start;
  final Color? end;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        padding: const EdgeInsets.all(40),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              start ?? Colors.blue,
              end ?? Colors.blueAccent,
            ]),
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  decoration: TextDecoration.none)),
        ));
  }
}

void main() {
  runApp(const MaterialApp(
    home: Column(
      children: [
        myButton(text: "OOP", start: Colors.white, end: Colors.green),
        myButton(text: "Dart", start: Colors.white, end: Colors.green),
        myButton(text: "Flutter", start: Colors.white, end: Colors.green),
      ],
    ),
  ));
}
