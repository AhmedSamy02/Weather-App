import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_city_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchCityView(),
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      
      //* You must provide the cubit and the state class names
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoWeatherBody(hasError: false);
          } else if (state is WeatherSucessState) {
            return WeatherInfoBody(/*data: state.weather*/);
          }
          return NoWeatherBody(hasError: true);
        },
      ),
    );
  }
}
/* 

! Why don't I use the setState here?
Because it's a low level state managment 
we use it only if all the changes occurs in the same screen.
Here the change of data occurs in search screen and its effect must 
occurs here and setState can't do that
#########################
#########################
#########################
* State Managment (Solution)[BLOC]
BLOC is a pattern (Business Logic Component)
BLoC: contains the logic and manages the states of your UI
You can say it's the intermediate layer between Logic and UI
* How it works
- It takes an event and pass it to logic then the output of it passed
to the UI using States
* Is there's a simpler way ?
Yes, Cubit it's a BLoC but simpler as it's the same as BLoC but there's
no events in it
TODO What are the steps of creating Cubit?
? 1- Create States
add all states that your UI will transform between them after using Cubit
and make all those states extends from other(parent) class
? 2- Create Cubit
Ceate class that extends Cubit<parent class in step 1>
? 3- Create Function
Type your logic that occurs between states
! Don't forget to use emit(state) method and define your initial state
? 4- Provide Cubit
1)provide the cubit for
1- the view that its states change
2- the view that responsible for changing the states
2) Wrap the parent of the views or the widgets that you want to make 
state management with them (home_view and search_view in this app)
(I wraped BlocProvider with MaterialApp)
? 5- Integrate Cubit
Add the blocBuilder widget to the place that has changable states 
? 6- Trigger Cubit
add this to the view that change the states of the other widget 
which is the search_view here

BlocProvider.of<CubitClassName>(context).functionName

#####################################################################
*pass the data between states
?You have two ways
1)
![Use this way if your UI has many leaves and roots]
In your state class add to the constructor of this state your needed data
and you can take those data in your provided (state.dataName)
you have to pass your data through the constructors of your views
2)
add your needed data in the cubit and access it in any place by 
BlocProvider.of<CubitClassName>(context).variableName
*/