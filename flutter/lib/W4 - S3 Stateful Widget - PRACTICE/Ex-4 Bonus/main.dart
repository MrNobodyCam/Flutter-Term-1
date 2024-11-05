import 'package:flutter/material.dart';

List<Color> valueColor = [
  Colors.white,
  Colors.green.shade50,
  Colors.green.shade100,
  Colors.green.shade200,
  Colors.green.shade300,
  Colors.green.shade400,
  Colors.green.shade500,
  Colors.green.shade600,
  Colors.green.shade700,
  Colors.green.shade800,
  Colors.green.shade900,
];

class Volume extends StatefulWidget {
  final String label;
  const Volume({super.key, required this.label});

  @override
  State<Volume> createState() => _VolumeState();
}

class _VolumeState extends State<Volume> {
  double value = 0.0;
  int index = 0;
  void addVolume() {
    setState(() {
      value += 30;
      index++;
      if (value > 300) {
        value = 300;
        index = 0;
      }
    });
    print(value);
    print(index);
  }

  void removeVolume() {
    setState(() {
      value -= 30;
      index--;
      if (value < 0) {
        value = 0;
        index = 9;
      }
    });
    print(value);
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Card(
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                widget.label,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                    fontSize: 30),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: addVolume, icon: const Icon(Icons.add)),
                  IconButton(
                      onPressed: removeVolume, icon: const Icon(Icons.remove)),
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: 306,
                    height: 53,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(color: Colors.grey.shade400, width: 3),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 3, top: 3),
                    width: value,
                    height: 47,
                    decoration: BoxDecoration(
                        color: valueColor[index],
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        backgroundColor: Colors.green.shade400,
        body: const Center(
          child: Column(
            children: [
              Volume(
                label: "My score in Flutter",
              ),
              Volume(
                label: "My score in Dart",
              ),
              Volume(
                label: "My score in React",
              ),
            ],
          ),
        )),
  ));
}
