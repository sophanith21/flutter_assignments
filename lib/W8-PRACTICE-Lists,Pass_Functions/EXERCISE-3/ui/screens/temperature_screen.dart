import 'package:flutter/material.dart';
import 'package:flutter_assignments/W8-PRACTICE-Lists,Pass_Functions/EXERCISE-3/main.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key, required this.onScreenChange});

  final ValueChanged<Screen> onScreenChange;

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  void onInputChange(String input) => setState(() {
    double celsius = double.tryParse(input) ?? 0.0;
    tempInFahrenheit = celsius * (9 / 5) + 32;
  });
  double tempInFahrenheit = 0;

  void back() => widget.onScreenChange(Screen.Welcome);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          spacing: 20,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.thermostat_outlined,
                  size: 120,
                  color: Colors.white,
                ),
                const Center(
                  child: Text(
                    "Converter",
                    style: TextStyle(color: Colors.white, fontSize: 45),
                  ),
                ),
                const SizedBox(height: 50),
                const Text("Temperature in Degrees:"),
                const SizedBox(height: 10),
                TextField(
                  onChanged: onInputChange,
                  decoration: inputDecoration,
                  style: const TextStyle(color: Colors.white),
                ),

                const SizedBox(height: 30),
                const Text("Temperature in Fahrenheit:"),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(tempInFahrenheit.toString()),
                ),
              ],
            ),

            ElevatedButton(
              onPressed: back,
              child: const Text(
                "Back",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 92, 143, 34),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
