import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  List<Widget> _getLabels() {
    return colors.map((e) => Text(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Label("Method 1: Loop in Array", bold: true),
              for (var i = 0; i < colors.length; i++) Text(colors[i]),

              Label("Method 2: Map", bold: true),
              ...colors.map((e) => Text(e)),

              Label("Method 23: Dedicated Function", bold: true),
              ..._getLabels(),
            ],
          ),
        ),
      ),
    );
  }
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: (bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
