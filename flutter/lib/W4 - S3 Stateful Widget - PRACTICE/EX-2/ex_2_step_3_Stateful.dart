import 'package:flutter/material.dart';

class FavoriteCard extends StatefulWidget {
  final bool isFavorite;
  const FavoriteCard({super.key, required this.isFavorite});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  Color getColor() {
    if (isFavorite) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  void checkFavorite() {
    setState(() {
      if (isFavorite == true) {
        isFavorite = false;
      } else {
        isFavorite = true;
      }
    });
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
                  'title',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 10.0),
                Text('description')
              ],
            ),
          ),
          IconButton(
            onPressed: checkFavorite, // Toggle favorite on press
            icon: Icon(
              Icons.favorite,
              color: getColor(), // Use color based on isFavorite
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(const MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            FavoriteCard(isFavorite: true),
            FavoriteCard(isFavorite: false),
            FavoriteCard(isFavorite: true),
            FavoriteCard(isFavorite: false),
          ],
        ),
      ),
    ));
