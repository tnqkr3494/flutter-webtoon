import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherModel {
  static Widget getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset("svg/climacon-cloud_lightning.svg");
    } else if (condition < 600) {
      return SvgPicture.asset("svg/climacon-cloud_lightning.svg");
    } else if (condition == 800) {
      return SvgPicture.asset("svg/climacon-sun.svg");
    } else {
      return SvgPicture.asset("svg/climacon-cloud_sun.svg");
    }
  }

  static Widget getAirIcon(int index) {
    if (index == 1) {
      return Image.asset(
        "image/good.png",
        width: 50,
        height: 50,
      );
    } else if (index == 2) {
      return Image.asset(
        "image/fair.png",
        width: 50,
        height: 50,
      );
    } else if (index == 3) {
      return Image.asset(
        "image/moderate.png",
        width: 50,
        height: 50,
      );
    } else if (index == 4) {
      return Image.asset(
        "image/poor.png",
        width: 50,
        height: 50,
      );
    } else {
      return Image.asset(
        "image/bad.png",
        width: 50,
        height: 50,
      );
    }
  }

  static Widget getAirState(int index) {
    if (index == 1) {
      return Text(
        "매우 좋음",
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
        ),
      );
    } else if (index == 2) {
      return Text(
        "좋음",
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
        ),
      );
    } else if (index == 3) {
      return Text(
        "보통",
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
        ),
      );
    } else if (index == 4) {
      return Text(
        "나쁨",
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
        ),
      );
    } else {
      return Text(
        "매우 나쁨",
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
        ),
      );
    }
  }
}
