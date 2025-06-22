import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherServer {
  Dio dio;
  final String baseUrl = "http://api.weatherapi.com/v1";
  final String apikey = "464d1037ecb14e44afd04126251606";
  WeatherServer( this.dio);

  Future<WeatherModel> getCurrentWeather({required String CityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apikey&q=$CityName&days=1',
      );

      WeatherModel weatherModel = WeatherModel.jsondata(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ??
          "opps there was an error , try later";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("opps there was an error , try later");
    }
  }
}
