import 'package:myweatherapp/services/location.dart';
import 'package:myweatherapp/services/networking.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=ef5ef66911777d804135599e0ca385e0&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=ef5ef66911777d804135599e0ca385e0&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherStats(int condition) {
    if (condition < 300) {
      return 'Thunderstorm';
    } else if (condition < 400) {
      return 'Drizzle';
    } else if (condition < 600) {
      return 'Raining';
    } else if (condition < 700) {
      return 'Snow️';
    } else if (condition < 800) {
      return 'Floggy';
    } else if (condition == 800) {
      return 'Clear Sky\nSunny️';
    } else if (condition <= 804) {
      return 'Cloudy️';
    } else {
      return '🤷‍';
    }
  }

  String bgImg(int condition) {
    if (condition < 300) {
      return 'images/less1.jpg';
    } else if (condition < 400) {
      return 'images/less2.jpg';
    } else if (condition < 600) {
      return 'images/less3.jpg';
    } else if (condition < 700) {
      return 'images/less4.jpg';
    } else if (condition < 800) {
      return 'images/less5.jpeg';
    } else if (condition == 800) {
      return 'images/less6.jpg';
    } else if (condition <= 804) {
      return 'images/less7.jpg';
    } else {
      return 'https://images.unsplash.com/photo-1539947257641-0f0e9f213528?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80‍';
    }
  }
}
