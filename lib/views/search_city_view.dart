import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchCityView extends StatelessWidget {
  SearchCityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            onSubmitted: (value) async {
              BlocProvider.of<GetWeatherCubit>(context)
                  .getCurrentWeather(cityName: value);
              Navigator.pop(context);
            },
            maxLines: 1,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.search),
              labelText: 'Search',
              hintText: 'Enter City Name',
              border: OutlineInputBorder()
            ),
          ),
        ),
      ),
    );
  }
}
