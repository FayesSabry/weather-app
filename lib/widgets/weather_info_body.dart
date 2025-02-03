import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_appp/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_appp/main.dart';
import 'package:weather_appp/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          getThemeColor(weatherModel.condition),
          getThemeColor(weatherModel.condition)[300]!,
          getThemeColor(weatherModel.condition)[50]!,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
                'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}'),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https:${weatherModel.image}',
                  fit: BoxFit.contain,
                ),
                Row(
                  children: [
                    Text(
                      weatherModel.temp.round().toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      '°',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('MaxTemp: ${weatherModel.maxTemp.round()}'),
                    Text('MinTemp: ${weatherModel.minTemp.round()}'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              weatherModel.condition,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
