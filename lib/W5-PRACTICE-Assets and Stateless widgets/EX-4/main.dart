import 'package:flutter/material.dart';

enum Weather {
  Cloudy('assets/W5-assets/ex4/cloudy.png'),
  Sunny('assets/W5-assets/ex4/sunny.png'),
  SunnyCloudy('assets/W5-assets/ex4/sunnyCloudy.png'),
  VeryCloudy('assets/W5-assets/ex4/veryCloudy.png');

  final String image;
  const Weather(this.image);
}

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu, color: Colors.white),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          WeatherCard(
            weather: Weather.Cloudy,
            city: 'Phnom Penh',
            minTemp: 10,
            maxTemp: 30,
            currentTemp: 12.2,
            colors: [Colors.purple.shade500, Colors.deepPurple],
          ),
          SizedBox(height: 15),
          WeatherCard(
            weather: Weather.SunnyCloudy,
            city: 'Paris',
            minTemp: 10,
            maxTemp: 40,
            currentTemp: 22.2,
            colors: [Colors.tealAccent.shade200, Colors.tealAccent.shade400],
          ),
          SizedBox(height: 15),
          WeatherCard(
            weather: Weather.Sunny,
            city: 'Rome',
            minTemp: 10,
            maxTemp: 40,
            currentTemp: 45.2,
            colors: [Colors.pink.shade300, Colors.pink.shade500],
          ),
          SizedBox(height: 15),
          WeatherCard(
            weather: Weather.VeryCloudy,
            city: 'Toulouse',
            minTemp: 10,
            maxTemp: 40,
            currentTemp: 45.2,
            colors: [Colors.orange.shade300, Colors.orange],
          ),
          SizedBox(height: 15),
          WeatherCard(
            weather: Weather.Sunny,
            city: 'New York',
            minTemp: 10,
            maxTemp: 30,
            currentTemp: 15.3,
            colors: [
              const Color.fromARGB(255, 179, 196, 244),
              const Color.fromARGB(255, 28, 94, 200),
            ],
          ),
          SizedBox(height: 15),
          WeatherCard(
            weather: Weather.VeryCloudy,
            city: 'Beijing',
            minTemp: 14,
            maxTemp: 2,
            currentTemp: 8,
            colors: [
              const Color.fromARGB(255, 210, 234, 114),
              const Color.fromARGB(255, 17, 193, 8),
            ],
          ),
        ],
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final Weather weather;
  final String city;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final List<Color> colors;
  const WeatherCard({
    super.key,
    required this.weather,
    required this.city,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 7,
      clipBehavior: Clip.antiAlias,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.centerRight,
          clipBehavior: Clip.antiAlias,
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: colors),
                ),
              ),
            ),
            Positioned(
              right: -20,
              child: Transform.rotate(
                angle: 0.6,
                child: ClipOval(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: colors),
                    ),
                    width: 150,
                    height: 200,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 15,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(weather.image),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            city,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Min: ${minTemp.toStringAsFixed(1)}°C',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'Max: ${maxTemp.toStringAsFixed(1)}°C',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "${currentTemp.toStringAsFixed(1)}°C",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
