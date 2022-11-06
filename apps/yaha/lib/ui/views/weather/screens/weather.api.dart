import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'weather.dart';

class WeatherApi {
  static Future<List<Weather>> getWeather(String city) async {
    var uri = Uri.https(
      'weatherapi-com.p.rapidapi.com',
      'forecast.json',
      {"q": city, "days": "3"},
    );
    final response = await http.get(uri, headers: {
      'x-rapidapi-host': 'weatherapi-com.p.rapidapi.com',
      'x-rapidapi-key':
          'c83b2e5b91msha5142959ed0486ap185d38jsn893dbd2fef6e' //TODO: add api key from https://rapidapi.com/weatherapi/api/weatherapi-com/
    });
    Map data = jsonDecode(response.body);
    debugPrint("***** $data");
    List _temp = [];
    for (var i in data['forecast']['forecastday']) {
      _temp.add(i);
    }
    return Weather.weatherFromSnapshot(_temp);
  }
}
