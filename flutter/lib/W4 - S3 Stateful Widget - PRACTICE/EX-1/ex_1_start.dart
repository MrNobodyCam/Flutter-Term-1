import 'package:flutter/material.dart';

enum ButtonType {
  NotSelected(
      label: "Not Selected",
      textColor: Colors.black,
      backgroundColor: Color(0xFFE3F2FD)),
  Selected(
      label: "Selected",
      textColor: Colors.white,
      backgroundColor: Color(0xFF21963F));

  final String label;
  final Color textColor;
  final Color backgroundColor;
  const ButtonType(
      {required this.label,
      required this.textColor,
      required this.backgroundColor});
}

// ignore: must_be_immutable
class Button extends StatefulWidget {
  ButtonType type;
  Button({super.key, required this.type});
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  void checkButton() {
    setState(() {
      if (widget.type == ButtonType.NotSelected) {
        widget.type = ButtonType.Selected;
      } else {
        widget.type = ButtonType.NotSelected;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Center(
        child: SizedBox(
          width: 400,
          height: 100,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: widget.type.backgroundColor),
              onPressed: checkButton,
              child: Center(
                child: Text(
                  widget.type.label,
                  style: TextStyle(color: widget.type.textColor),
                ),
              )),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Column(
          children: [
            Button(
              type: ButtonType.NotSelected,
            ),
            Button(
              type: ButtonType.Selected,
            ),
            Button(
              type: ButtonType.NotSelected,
            ),
            Button(
              type: ButtonType.Selected,
            )
          ],
        ),
      ),
    ));
