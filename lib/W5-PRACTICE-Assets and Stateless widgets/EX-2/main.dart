import 'package:flutter/material.dart';

enum ButtonType {
  primary(color: Colors.blue),
  secondary(color: Colors.green),
  disabled(color: Colors.grey);

  final Color color;
  const ButtonType({required this.color});
}

enum IconPos { left, right }

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Buttons")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 20,
          children: [
            CustomButton(label: "Submit", iconData: Icons.check),
            CustomButton(
              label: "Time",
              iconData: Icons.access_time,
              bttnType: ButtonType.secondary,
              iconPos: IconPos.right,
            ),
            CustomButton(
              label: "Account",
              iconData: Icons.account_tree,
              bttnType: ButtonType.disabled,
              iconPos: IconPos.right,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final ButtonType bttnType;
  final IconPos iconPos;
  final String label;
  final IconData iconData;

  const CustomButton({
    super.key,
    this.bttnType = ButtonType.primary,
    this.iconPos = IconPos.left,
    required this.label,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bttnType.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: iconPos == IconPos.left
            ? [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(iconData, color: Colors.white),
                ),
                Text(label, style: TextStyle(color: Colors.white)),
              ]
            : [
                Text(label, style: TextStyle(color: Colors.white)),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(iconData, color: Colors.white),
                ),
              ],
      ),
    );
  }
}
