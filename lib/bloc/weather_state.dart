part of 'weather_bloc.dart';

@immutable
abstract class WeatherBlocState {}

class WeatherBlocInitial extends WeatherBlocState {}

class WeatherLoading extends WeatherBlocState {}

class WeatherLoaded extends WeatherBlocState {
  final WeatherModel weather;
  WeatherLoaded({required this.weather});
}

class WeatherError extends WeatherBlocState {
  final String message;
  WeatherError(this.message);
}
