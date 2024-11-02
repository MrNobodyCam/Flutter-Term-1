import 'package:flutter/material.dart';

class HobbyCard extends StatelessWidget {
  String title;
  IconData icon;
  Color? backgrounColor;
  HobbyCard(
      {super.key,
      required this.title,
      required this.icon,
      this.backgrounColor = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: backgrounColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 30),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HobbyCard(
                title: "Travelling",
                icon: Icons.travel_explore,
                backgrounColor: Colors.green.shade400,
              ),
              HobbyCard(
                title: "Skating",
                icon: Icons.roller_skating,
                backgrounColor: Colors.brown,
              ),
            ],
          )),
    ),
  ));
}
