import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FavoriteCard extends StatelessWidget {
  bool isFavorite;
  FavoriteCard({super.key, required this.isFavorite});

  Color getColor() {
    if (isFavorite == true) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  Text("Description"),
                  SizedBox(height: 10.0),
                ],
              )),
          IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.favorite,
              color: getColor(),
            ),
          )
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [],
          )),
    ));
