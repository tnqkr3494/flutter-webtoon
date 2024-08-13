import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:toonflix/models/weather_model.dart';

class WeatherScreen extends StatefulWidget {
  final dynamic weatherData;
  final dynamic airData;

  const WeatherScreen(
      {super.key, required this.weatherData, required this.airData});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName, description;
  late int temp;
  late double dust1, dust2;
  late Widget icon, icon2, airState;

  late var date = DateTime.now();

  @override
  void initState() {
    super.initState();
    updateData(widget.weatherData, widget.airData);
  }

  void updateData(dynamic weatherData, dynamic airData) {
    cityName = weatherData["name"];
    double temp2 = weatherData["main"]["temp"];
    temp = temp2.toInt();
    description = weatherData["weather"][0]["description"];
    icon = WeatherModel.getWeatherIcon(weatherData["weather"][0]["id"]);
    icon2 = WeatherModel.getAirIcon(airData["list"][0]["main"]["aqi"]);
    airState = WeatherModel.getAirState(airData["list"][0]["main"]["aqi"]);
    dust1 = airData["list"][0]["components"]["pm10"];
    dust2 = airData["list"][0]["components"]["pm2_5"];
  }

  String getSysTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(
            Icons.near_me,
            color: Colors.white,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.location_searching,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Container(
          child: Stack(
            children: [
              Image.asset(
                "image/background.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 200,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cityName,
                                style: const TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                children: [
                                  TimerBuilder.periodic(
                                    const Duration(minutes: 1),
                                    builder: (context) {
                                      return Text(
                                        getSysTime(),
                                        style: GoogleFonts.lato(
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                  ),
                                  Text(
                                    DateFormat(" - EEEE").format(date),
                                    style: GoogleFonts.lato(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    DateFormat(" d MMM y").format(date),
                                    style: GoogleFonts.lato(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 200,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("$temp\u2103",
                                  style: GoogleFonts.lato(
                                    fontSize: 70,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  )),
                              Row(
                                children: [
                                  icon,
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    description,
                                    style:
                                        GoogleFonts.lato(color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Column(
                          children: [
                            const Divider(
                              height: 20,
                              thickness: 2,
                              color: Colors.white,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      "AQI(대기질지수)",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    icon2,
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    airState,
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      "미세먼지",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "$dust1",
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '㎍/m3',
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      "초미세먼지",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "$dust2",
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontSize: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '㎍/m3',
                                      style: GoogleFonts.lato(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
