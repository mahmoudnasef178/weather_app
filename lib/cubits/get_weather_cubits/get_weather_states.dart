import 'package:weather_app/model/weather_model.dart';

class WeatherStates 
{

}

class initialState extends WeatherStates
{}
class weathherLoudedStates extends WeatherStates
{
   late final WeatherModel weatherModel;

  weathherLoudedStates( this.weatherModel);
}
class weatherFixedStates extends WeatherStates
{
   final String errorMessage;
  weatherFixedStates(this.errorMessage);
}