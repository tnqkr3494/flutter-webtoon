import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

    final airData =
        await ApiService.getAirDetail(position.latitude, position.longitude);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherScreen(
          weatherData: weatherData,
          airData: airData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[400],
      body: const Center(
        child: SpinKitDualRing(
          color: Colors.white,
        ),
      ),
    );
  }
}
