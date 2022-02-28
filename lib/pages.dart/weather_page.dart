import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_weather/bloc/weather_bloc.dart';
import 'package:lesson_weather/models/weather_model.dart';
import 'package:lesson_weather/pages.dart/weather_data.dart';
import 'package:lesson_weather/services/weather_repository.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage({Key? key}) : super(key: key);

  final WeatherRepository weatherRepository = WeatherRepository();

  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final WeatherBloc weatherBloc = WeatherBloc(repository: weatherRepository);

    return Scaffold(
      body: BlocProvider(
        create: (context) => weatherBloc,
        child: BlocConsumer<WeatherBloc, WeatherBlocState>(
          bloc: weatherBloc,
          builder: (context, state) {
            if (state is WeatherBlocInitial) {
              return BlocProvider.value(
                value: weatherBloc,
                child: WeatherData(),
              );
            } else if (state is WeatherLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherLoaded) {
              return WeatherData(weatherModel: state.weather);
            } else if (state is WeatherError) {
              return const Center(child: Text("Произошла ошибка"));
            }
            return const Center(child: Text("Incorrect State"));
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
