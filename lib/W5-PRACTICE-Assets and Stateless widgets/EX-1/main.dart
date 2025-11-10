import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("My hobbies")),
        backgroundColor: Colors.grey,
        body: const Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 10,
            children: [
              HobbyCard(
                iconData: Icons.travel_explore,
                title: "Travelling",
                bgColor: Colors.green,
              ),
              HobbyCard(
                iconData: Icons.skateboarding,
                title: "Skating",
                bgColor: Colors.blueGrey,
              ),
              HobbyCard(iconData: Icons.hearing, title: "Listening to music"),
            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Color bgColor;

  const HobbyCard({
    super.key,
    required this.iconData,
    required this.title,
    this.bgColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(30),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Icon(iconData, color: Colors.white, size: 30),
            ),
            Text(title, style: TextStyle(color: Colors.white, fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
