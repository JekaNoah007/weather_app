part of 'weather_bloc.dart';

@immutable
abstract class WeatherBlocEvent {}

class GetWeatherCountryEvent extends WeatherBlocEvent {
  final String countryName;

  GetWeatherCountryEvent({required this.countryName});
}
