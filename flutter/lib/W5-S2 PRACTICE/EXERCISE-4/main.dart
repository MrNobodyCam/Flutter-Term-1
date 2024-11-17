import 'package:flutter/material.dart';
import 'package:lutter/W5-S2%20PRACTICE/EXERCISE-4/jokes.dart';

Color appColor = Colors.green[300]!;

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: JokesList(),
      ),
    ));

class JokesList extends StatefulWidget {
  @override
  JokesListState createState() => JokesListState();
}

class JokesListState extends State<JokesList> {
  int favoriteJokeIndex = -1;
  void toggleFavorite(int index) {
    setState(() {
      if (favoriteJokeIndex == index) {
        favoriteJokeIndex = -1;
        jokes[index].favorite = false;
      } else {
        if (favoriteJokeIndex != -1) {
          jokes[favoriteJokeIndex].favorite = false;
        }
        favoriteJokeIndex = index;
        jokes[index].favorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) {
        return FavoriteCard(
          joke: jokes[index],
          isFavorite: jokes[index].favorite,
          toggleFavorite: () => toggleFavorite(index),
        );
      },
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final Joke joke;
  final bool isFavorite;
  final Function toggleFavorite;

  const FavoriteCard({
    required this.joke,
    required this.isFavorite,
    required this.toggleFavorite,
    super.key,
  });

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
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style:
                      TextStyle(color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description),
              ],
            ),
          ),
          IconButton(
            onPressed: () => toggleFavorite(),
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
