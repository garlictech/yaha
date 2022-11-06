import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi2 {
  static Future<String> getWeather(String city) async {
    var uri = Uri.https(
      'weatherapi-com.p.rapidapi.com',
      'forecast.json',
      {"q": city},
    );
    final response = await http.get(uri, headers: {
      'x-rapidapi-host': 'weatherapi-com.p.rapidapi.com',
      'x-rapidapi-key':
          'c83b2e5b91msha5142959ed0486ap185d38jsn893dbd2fef6e' //TODO: add api key from https://rapidapi.com/weatherapi/api/weatherapi-com/
    });
    Map data = jsonDecode(response.body);

    return data['location']['name'];
  }
}
