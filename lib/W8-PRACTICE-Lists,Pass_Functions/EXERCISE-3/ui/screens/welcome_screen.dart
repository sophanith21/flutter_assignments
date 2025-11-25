import 'package:flutter/material.dart';
import 'package:flutter_assignments/W8-PRACTICE-Lists,Pass_Functions/EXERCISE-3/main.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.onScreenChange});

  final ValueChanged<Screen> onScreenChange;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void start() => widget.onScreenChange(Screen.Temperature);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
          ),
          const Text(
            "Welcome !",
            style: TextStyle(color: Colors.white, fontSize: 50),
          ),
          const SizedBox(height: 15),
          OutlinedButton(
            onPressed: start,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 1.0, color: Colors.white),
            ),
            child: const Text(
              'Start to convert',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
