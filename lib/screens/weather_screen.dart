import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  final dynamic weatherData;

  const WeatherScreen({super.key, required this.weatherData});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName;
  late int temp;

  @override
  void initState() {
    super.initState();
    updateData(widget.weatherData);
  }

  void updateData(dynamic weatherData) {
    print(weatherData);
    cityName = widget.weatherData["name"];
    double temp2 = widget.weatherData["main"]["temp"];
    temp = temp2.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(cityName),
            Text("$temp"),
          ],
        ),
      ),
    );
  }
}
