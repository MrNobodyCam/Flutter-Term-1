import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: 500,
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
              child: Text(
                "OOP",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: 500,
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
              child: Text(
                "Dart",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: 500,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                    colors: [Colors.blue.shade300, Colors.blue.shade600])),
            child: const Center(
              child: Text(
                "Flutter",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    ),
  ));
}
