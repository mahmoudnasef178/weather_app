import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubits/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubits/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, State) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getWeatherTextColor(
                  BlocProvider.of<GetWeatherCubit>(
                    context,
                  ).weatherModel?.condition,
                ),
                useMaterial3: false,
              ),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getWeatherTextColor(String? condition) {
  if (condition == null) {
    return Colors.red;
  } else if (condition == "Sunny" || condition == "clear") {
    return Colors.orange;
  } else if (condition == "partly cloudy") {
    return Colors.lightBlue;
  } else if (condition == "cloudy" || condition == "overcast") {
    return Colors.blueGrey;
  } else if (condition == "mist" ||
      condition == "fog" ||
      condition == "freezing fog") {
    return Colors.grey;
  } else if (condition == ("drizzle") || condition == ("freezing drizzle")) {
    return Colors.cyan;
  } else if (condition == ("patchy light rain") ||
      condition == ("light rain") ||
      condition == ("light rain shower")) {
    return Colors.lightBlue;
  } else if (condition == ("moderate") ||
      condition == ("heavy") ||
      condition == ("torrential")) {
    return Colors.indigo;
  } else if (condition == ("snow") ||
      condition == ("blizzard") ||
      condition == ("blowing snow")) {
    return Colors.blueGrey;
  } else if (condition == ("sleet") || condition == ("ice pellets")) {
    return Colors.deepPurple;
  } else if (condition == ("thunder")) {
    return Colors.deepPurple;
  }

  return Colors.blueGrey;
}
