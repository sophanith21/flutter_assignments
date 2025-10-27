import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(40),
        margin: EdgeInsets.all(50),
        child: Column(
          spacing: 20,
          children: [
            CustomCard(text: "OOP", color: Colors.blue.shade100),
            CustomCard(text: "DART", color: Colors.blue.shade300),
            CustomCard(
              text: "FLUTTER",
              colors: [Colors.blue.shade300, Colors.blue.shade600],
            ),
          ],
        ),
      ),
    ),
  );
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color color;
  final List<Color>? colors;
  const CustomCard({required this.text, this.color = Colors.blue, this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors == null ? color : null,
        gradient: colors != null ? LinearGradient(colors: colors!) : null,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
