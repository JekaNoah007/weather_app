import 'package:lesson_weather/services/weather_api_provider.dart';

class WeatherRepository {
  final WeatherProvider _weatherProvider = WeatherProvider();
  Future getWeather(String country) => _weatherProvider.getWeather(country);
}
