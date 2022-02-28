import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_weather/bloc/weather_bloc.dart';
import 'package:lesson_weather/services/weather_repository.dart';

import '../models/weather_model.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({Key? key, this.weatherModel}) : super(key: key);

  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    TextEditingController cityController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 252, 151, 0),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            Text(
              "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 15),
            Text(
              "${DateTime.now().hour}:${DateTime.now().minute}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: const Icon(
                    Icons.wb_sunny_outlined,
                    size: 200,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              weatherModel?.main?.temp.toString() ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 65,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: cityController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: "Введите город",
                hintStyle: TextStyle(color: Colors.white),
              ),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 0, 255, 8),
                minimumSize: const Size(300, 50),
              ),
              onPressed: () {
                BlocProvider.of<WeatherBloc>(context).add(
                    GetWeatherCountryEvent(countryName: cityController.text));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.search),
                  Text(
                    "Поиск",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// "${}°C - ${}°C"