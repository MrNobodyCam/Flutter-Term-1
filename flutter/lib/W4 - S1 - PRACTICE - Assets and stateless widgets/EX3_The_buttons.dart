// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'randomImage.dart';
//
// void main() => runApp(const MaterialApp(
//   home: Scaffold(
//     backgroundColor: Colors.deepPurple,
//     body: Center(child: DiceRoller()),
//   ),
// ));

import 'package:flutter/material.dart';

enum Type {
  Primary(Colors.blue),
  Secondary(Colors.green),
  Disable(Colors.grey);

  final Color color;
  const Type(this.color);
}

enum Position {
  Left(iconAlignment: IconAlignment.start),
  Right(iconAlignment: IconAlignment.end);

  final IconAlignment iconAlignment;
  const Position({required this.iconAlignment});
}

class CustomButton extends StatelessWidget {
  final Type type;
  final Position position;
  final IconData icon;
  final String label;
  const CustomButton(
      {super.key,
      required this.type,
      this.position = Position.Left,
      required this.icon,
      required this.label});

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 350,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: onPressed,
              icon: Icon(icon, color: Colors.black),
              iconAlignment: position.iconAlignment,
              label: Text(
                label,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(type.color),
              ),
            ),
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
        child: const Column(
          children: [
            CustomButton(
              type: Type.Primary,
              label: "Submit",
              icon: Icons.check,
            ),
            CustomButton(
              type: Type.Secondary,
              label: "Time",
              icon: Icons.timeline,
              position: Position.Right,
            ),
            CustomButton(
              type: Type.Disable,
              label: "Account",
              icon: Icons.account_balance_outlined,
            ),
          ],
        ),
      ),
    ),
  ));
}
