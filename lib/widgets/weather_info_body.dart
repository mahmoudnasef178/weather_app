import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubits/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel = BlocProvider.of<GetWeatherCubit>(
      context,
    ).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getWeatherTextColor(weatherModel.condition),
            getWeatherTextColor(weatherModel.condition)[300]!,
            getWeatherTextColor(weatherModel.condition)[50]!,

          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.NameCity,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            Text(
              "apdated at  ${weatherModel.data.hour}:${weatherModel.data.minute}",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(image: NetworkImage("https:${weatherModel.image}")),

                Text(
                  "${weatherModel.temp}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Column(
                  children: [
                    Text(
                      'Max Temp : ${weatherModel.maxTemp.round()}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Min Temp: ${weatherModel.minTemp.round()}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              '${weatherModel.condition}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
