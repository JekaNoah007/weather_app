import 'package:dio/dio.dart';
import 'package:lesson_weather/models/weather_model.dart';

class WeatherProvider {
  Future<WeatherModel> getWeather(String country) async {
    final response = await Dio().get(
        "https://api.openweathermap.org/data/2.5/weather?q=$country&appid=e092f2bec33624c5c0f53d0e4fea087b");

    if (response.statusCode == 200) {
      final dynamic weatherJson = response.data;
      print(response.data);
      return WeatherModel.fromJson(weatherJson);
    } else {
      throw Exception('Error fetching Users');
    }
  }
}
