import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

class ChangeImage extends StatefulWidget {
  const ChangeImage({super.key});

  @override
  State<ChangeImage> createState() => _ChangeImageState();
}

class _ChangeImageState extends State<ChangeImage> {
  int index = 0;
  void nextImage() {
    setState(() {
      index++;
      if (index > 4) {
        index = 0;
      }
    });
  }

  void previousImage() {
    setState(() {
      index--;
      if (index < 0) {
        index = images.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: previousImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: nextImage,
            ),
          ),
        ],
      ),
      body: Image.asset(images[index]),
    );
  }
}

void main() => runApp(const MaterialApp(
      //We use to hide the red line debug in top right of screen
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      home: ChangeImage(),
    ));
// Type of state that i need to keep is local state
// Widget that i need to warp into your stateful widget is Scarful because it can show all data that i need in body and appBar