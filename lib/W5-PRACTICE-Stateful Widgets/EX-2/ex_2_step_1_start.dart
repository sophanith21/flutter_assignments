import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(children: [FavoriteCard(), FavoriteCard(), FavoriteCard()]),
    ),
  ),
);

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;
  Color? get color => isFavorite ? Colors.red : null;

  void handleFavoriteClick() => setState(() {
    isFavorite = !isFavorite;
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "title",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 10),
                Text('description'),
              ],
            ),
          ),
          IconButton(
            onPressed: handleFavoriteClick,
            icon: Icon(Icons.favorite, color: color),
          ),
        ],
      ),
    );
  }
}
