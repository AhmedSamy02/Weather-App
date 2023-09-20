import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
  Weather? weatherModel;
  getCurrentWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherServices.instance.getWeatherData(cityName);
      emit(WeatherSucessState(weather: weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailureState());
    }
  }
}
