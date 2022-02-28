import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_weather/models/weather_model.dart';
import 'package:lesson_weather/services/weather_repository.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  final WeatherRepository repository;

  WeatherBloc({required this.repository}) : super(WeatherBlocInitial()) {
    on<GetWeatherCountryEvent>((event, emit) async {
      try {
        emit(WeatherLoading());
        print(' event.name == ${event.countryName}');
        dynamic data = await WeatherRepository().getWeather(event.countryName);
        emit(WeatherLoaded(weather: data));
      } catch (_) {
        emit(WeatherError("error"));
      }
    });
  }
}
