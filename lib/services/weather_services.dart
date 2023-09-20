import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  WeatherServices._();
  static final instance = WeatherServices._();
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey = 'a2614850ab8080b3561d38b32b02e609';
  final dio = Dio();

  Future<Weather> getWeatherData(String country) async {
    try {
      final response = await dio.get(
        '$baseUrl?q=$country&appid=$apiKey&units=metric',
      );
      return Weather.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('There\'s an error try again later\n$e');
    }
  }
}
