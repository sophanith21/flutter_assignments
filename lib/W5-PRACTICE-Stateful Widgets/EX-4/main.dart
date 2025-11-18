import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightGreenAccent,
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          spacing: 15,
          children: [
            ScoreWidget(subject: "Flutter"),
            ScoreWidget(subject: "Dart"),
            ScoreWidget(subject: "React"),
          ],
        ),
      ),
    );
  }
}

class ScoreWidget extends StatefulWidget {
  final String subject;

  const ScoreWidget({super.key, required this.subject});

  @override
  State<ScoreWidget> createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> {
  int currentScore = 0;

  double get currentPercentage => currentScore / 10;
  Color get barColor {
    if (currentScore >= 8) {
      return Colors.green.shade900;
    } else if (currentScore >= 3) {
      return Colors.green.shade500;
    } else {
      return Colors.green.shade300;
    }
  }

  void increaseScore() => setState(() {
    currentScore = min(currentScore + 1, 10);
  });

  void decreaseScore() => setState(() {
    currentScore = max(currentScore - 1, 0);
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      constraints: const BoxConstraints(minWidth: 0, maxWidth: 700),

      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "My score in ${widget.subject}",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: decreaseScore,
                icon: const Icon(Icons.remove),
              ),
              IconButton(onPressed: increaseScore, icon: const Icon(Icons.add)),
            ],
          ),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 30,
                width: 400,
              ),
              Container(
                height: currentPercentage == 0
                    ? 0
                    : 30, // To remove the awkward green line when score is 0
                width: 400 * currentPercentage,
                decoration: BoxDecoration(
                  color: barColor,
                  border: Border.all(color: barColor, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
