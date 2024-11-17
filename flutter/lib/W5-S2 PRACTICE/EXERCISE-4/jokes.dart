class Joke {
  final String title;
  final String description;
  bool favorite;
  Joke({required this.title, required this.description, this.favorite = false});
}

final List<Joke> jokes = [
  for (var i = 1; i <= 20; i++)
    Joke(title: 'Joke $i', description: 'description $i')
];
