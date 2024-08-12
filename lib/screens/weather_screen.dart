import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class WeatherScreen extends StatefulWidget {
  final dynamic weatherData;

  const WeatherScreen({super.key, required this.weatherData});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late String cityName;
  late int temp;
  var date = DateTime.now();

  @override
  void initState() {
    super.initState();
    updateData(widget.weatherData);
  }

  void updateData(dynamic weatherData) {
    cityName = widget.weatherData["name"];
    double temp2 = widget.weatherData["main"]["temp"];
    temp = temp2.toInt();
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
                              const Text(
                                "Seoul",
                                style: TextStyle(
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
                              Text("18\u2103",
                                  style: GoogleFonts.lato(
                                    fontSize: 70,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  )),
                              Row(
                                children: [
                                  SvgPicture.asset("svg/climacon-sun.svg"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "clear sky",
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
                                    Image.asset(
                                      "image/bad.png",
                                      width: 50,
                                      height: 50,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '매우나쁨',
                                      style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
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
                                      "174.75",
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
                                      "84.03",
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
