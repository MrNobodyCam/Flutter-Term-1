import 'package:flutter/material.dart';
import 'package:lutter/W5-S2%20PRACTICE/EXERCISE-3/screen/temperature.dart';
import 'package:lutter/W5-S2%20PRACTICE/EXERCISE-3/screen/welcome.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() => _TemperatureAppState();
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool isClicked = false;
  void checkClick() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff16C062), Color(0xff00BCDC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: isClicked ? Temperature() : Welcome(checkClick: checkClick),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
