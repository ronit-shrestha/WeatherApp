import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapp/classes.dart';

class HttpService {
  Future gethttpservice(String city) async {
    final response = await http
        .get(Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': city,
      'appid': 'e9cd62dfd8f2065e3e59cfaf7c8bc1ac',
      'units': 'metric',
    }));

    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
