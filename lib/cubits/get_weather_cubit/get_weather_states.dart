import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherSucessState extends WeatherState {
  Weather weather;
  WeatherSucessState({required this.weather});
}

class WeatherFailureState extends WeatherState {}
