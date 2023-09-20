class Weather {
  int temperature = 0;
  int feelsLikeTemp = 0;
  int maxTemp = 0;
  int minTemp = 0;
  String weatherState = 'N/A';
  String weatherStateLink = 'N/A';
  String cityName = 'N/A';
  String icon = 'N/A';
  DateTime currentDT = DateTime.now();
  Weather({
    required this.temperature,
    required this.feelsLikeTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherState,
    required this.weatherStateLink,
    required this.cityName,
    required this.currentDT,
    required this.icon,
  });
  factory Weather.fromJson(dynamic json) {
    double temp = json['main']['temp'];
    double fTemp = json['main']['feels_like'];
    double maxTemp = json['main']['temp_max'];
    double minTemp = json['main']['temp_min'];
    int dt = json['dt'];
    String icon = json['weather'][0]['icon'];
    return Weather(
      temperature: temp.round(),
      feelsLikeTemp: fTemp.round(),
      maxTemp: maxTemp.round(),
      minTemp: minTemp.round(),
      weatherState: json['weather'][0]['description'],
      weatherStateLink: 'https://openweathermap.org/img/wn/$icon@2x.png',
      cityName: json['name'],
      currentDT: DateTime.fromMillisecondsSinceEpoch(dt * 1000),
      icon: icon,
    );
  }
}
