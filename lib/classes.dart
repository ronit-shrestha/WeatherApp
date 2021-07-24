class Weather {
  String description;
  var icon;
  Weather({required this.description, required this.icon});
  factory Weather.fromJson(Map json) =>
      Weather(description: json['description'], icon: json['icon']);
}

class Temperature {
  double temp, tempmax, tempmin;
  Temperature(
      {required this.temp, required this.tempmax, required this.tempmin});
  factory Temperature.fromJson(Map json) => Temperature(
      temp: json['temp'], tempmax: json['temp_max'], tempmin: json['temp_min']);
}

class WeatherResponse {
  String name;
  Temperature temp, tempmax, tempmin;
  Weather description, icon;
  WeatherResponse(
      {required this.name,
      required this.temp,
      required this.description,
      required this.icon,
      required this.tempmax,
      required this.tempmin});
  factory WeatherResponse.fromJson(Map json) => WeatherResponse(
      name: json['name'],
      temp: Temperature.fromJson(json['main']),
      description: Weather.fromJson(json['weather'][0]),
      icon: Weather.fromJson(json['weather'][0]),
      tempmax: Temperature.fromJson(json['main']),
      tempmin: Temperature.fromJson(json['main']));
}
