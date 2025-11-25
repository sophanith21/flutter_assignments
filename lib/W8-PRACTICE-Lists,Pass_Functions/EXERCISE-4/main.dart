import 'package:flutter/material.dart';
import 'package:flutter_assignments/W8-PRACTICE-Lists,Pass_Functions/EXERCISE-4/data/jokes_data.dart';
import 'package:flutter_assignments/W8-PRACTICE-Lists,Pass_Functions/EXERCISE-4/model/joke.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? favoriteIndex;

  void onFavorite(int? index) => setState(() {
    favoriteIndex = index;
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: ListView.builder(
          itemCount: jokes.length,
          itemBuilder: (context, index) => FavoriteCard(
            joke: jokes[index],
            onFavorite: onFavorite,
            index: index,
            favoriteIndex: favoriteIndex,
          ),
        ),
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.joke,
    required this.onFavorite,
    required this.index,
    required this.favoriteIndex,
  });
  final Joke joke;
  final int? favoriteIndex;
  final int index;
  final ValueChanged<int?> onFavorite;

  String get title => joke.title;
  String get description => joke.description;

  void onFavoriteClick() {
    if (favoriteIndex == null) {
      onFavorite(index);
    } else if (favoriteIndex == index) {
      onFavorite(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isFavorite = favoriteIndex == index;
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
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
                  title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
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
