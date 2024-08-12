import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:toonflix/screens/weather_screen.dart';
import 'package:toonflix/services/api_service.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final weatherData = await ApiService.getLocationDetail(
        position.latitude, position.longitude);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherScreen(
          weatherData: weatherData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 40,
            ),
          ),
          onPressed: null,
          child: const Text(
            "Click this Button",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
