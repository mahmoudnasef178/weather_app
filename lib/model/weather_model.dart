class WeatherModel {
  final String NameCity;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final DateTime data;
  final String condition;

  WeatherModel({
    required this.NameCity,
    required this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.data,
    required this.condition,
  });

  factory WeatherModel.jsondata(json) {
    return WeatherModel(
      NameCity: json['location']['name'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      data: DateTime.parse(json['current']['last_updated']),
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
