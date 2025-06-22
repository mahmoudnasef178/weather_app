import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubits/get_weather_states.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/servers/Weather_server.dart';

class GetWeatherCubit extends Cubit <WeatherStates>{
  GetWeatherCubit():super(initialState());
   WeatherModel? weatherModel;
   GetWeather ({required String CityName}) async
  {
    try {
  weatherModel= await WeatherServer(Dio()).getCurrentWeather(CityName: CityName); 
  emit(weathherLoudedStates( weatherModel!));
}  catch (e) {
  emit(weatherFixedStates(e.toString()));
}
  }
}