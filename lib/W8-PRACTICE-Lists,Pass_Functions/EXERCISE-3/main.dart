import 'package:flutter/material.dart';
import 'package:flutter_assignments/W8-PRACTICE-Lists,Pass_Functions/EXERCISE-3/ui/screens/temperature_screen.dart';

import 'ui/screens/welcome_screen.dart';

enum Screen { Welcome, Temperature }

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key, required this.initialScreen});

  final Screen initialScreen;

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  Screen currentScreen = Screen.Welcome;

  @override
  void initState() {
    super.initState();
    currentScreen = widget.initialScreen;
  }

  void handleScreenChange(Screen newScreen) => setState(() {
    currentScreen = newScreen;
  });

  Widget? getCurrentScreen() {
    switch (currentScreen) {
      case Screen.Welcome:
        return WelcomeScreen(onScreenChange: handleScreenChange);
      case Screen.Temperature:
        return TemperatureScreen(onScreenChange: handleScreenChange);
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff16C062), Color(0xff00BCDC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: getCurrentScreen(),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp(initialScreen: Screen.Welcome));
}
