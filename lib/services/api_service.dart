import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = '0d0cc1131b44cd6ea0027e60e69dc007';

class ApiService {
  static Future<dynamic> getLocationDetail(
      double latitude, double longitude) async {
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric");

    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final weatherData = jsonDecode(response.body);
      return weatherData;
    }
    throw Error();
  }
}
