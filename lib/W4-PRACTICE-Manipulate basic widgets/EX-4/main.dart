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
            CustomCard(
              text: "OOP",
              color: Colors.blue.shade100,
            ), // Using shade instead of Colors.blue[100]!
            CustomCard(text: "DART", color: Colors.blue.shade300),
            CustomCard(
              text: "FLUTTER",
              gradient: LinearGradient(
                colors: [Colors.blue.shade300, Colors.blue.shade600],
              ),
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
  final Gradient? gradient;
  const CustomCard({
    super.key,
    required this.text,
    this.color = Colors.blue,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: gradient == null ? color : null,
        gradient: gradient,
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
