import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Stateful widget - Button")),
      body: Center(
        child: Column(
          spacing: 10,
          children: [
            ButtonWidget(),
            ButtonWidget(),
            ButtonWidget(),
            ButtonWidget(),
          ],
        ),
      ),
    ),
  ),
);

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool isSelected = false;
  String get textLabel => isSelected ? "Selected" : "Not Selected";
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get backgroundColor =>
      isSelected ? Colors.blue.shade500 : Colors.blue.shade50;

  void handleClick() => setState(() {
    isSelected = !isSelected;
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        onPressed: handleClick,
        child: Center(
          child: Text(
            textLabel,
            style: TextStyle(color: textColor, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
