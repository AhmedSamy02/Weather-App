import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
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
      child: Builder(builder: (context) {
//* I used builder as to use BlocProvider the passed context musn't use
//* the same context as the create as it looks up the tree of UI and
//* in this case it doesn't have context above it so you have to use builder
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            MaterialColor themeColor = getThemeColor(
                BlocProvider.of<GetWeatherCubit>(context).weatherModel?.icon);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: themeColor,
              ),
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getThemeColor(String? weatherState) {
  if (weatherState == null) return Colors.brown;
  switch (weatherState) {
    case '01d':
      return Colors.orange;
    case '01n':
      return Colors.deepOrange;
    case '03d':
    case '03n':
    case '04d':
    case '04n':
      return Colors.blueGrey;
    case '02d':
    case '02n':
    case '09d':
    case '09n':
    case '10d':
    case '10n':
    case '11d':
    case '11n':
      return Colors.grey;
    case '13d':
    case '13n':
      return Colors.lightBlue;
    default:
      return Colors.blue;
  }
}
