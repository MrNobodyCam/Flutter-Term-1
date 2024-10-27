import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: EdgeInsets.all(40),
      margin: EdgeInsets.all(50),
      color: Colors.blue[300],
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue[600], borderRadius: BorderRadius.circular(15)),
        child: const Center(
          child: Text(
            "CADT Student",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  ));
}
