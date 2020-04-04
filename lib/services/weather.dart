import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';
const apiKey = "ad3a4ca4aa37c35201306bd40bc4d77c";

class WeatherModel {

  Future<dynamic> getCityData(String cityName) async{
    NetworkHelper networkHelper = NetworkHelper(url: "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric");
    var cityData= await networkHelper.getData();
    return cityData;
  }

  Future<dynamic> getData() async{
     Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        url:'https://api.openweathermap.org/data/2.5/weather?lat=${location.getLatitude()}&lon=${location.getLongitude()}&appid=$apiKey&units=metric');
     var weatherData= await networkHelper.getData();
     return weatherData;
  }
  
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
