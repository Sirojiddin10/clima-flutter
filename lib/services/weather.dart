import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper nh = NetworkHelper(
        url: kUrl,
        unencodedPath: kUnencodedPath,
        city: cityName,
        appId: kAPI_KEY);
    var weatherCityData = await nh.getCityWeatherData();
    return weatherCityData;
  }

  Future<dynamic> getLocationWeather() async {
    double latitude;
    double longitude;
    Location currentLocation = Location();
    await currentLocation.getCurrentLocation();
    latitude = currentLocation.latitude;
    longitude = currentLocation.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        url: kUrl,
        unencodedPath: kUnencodedPath,
        latitude: latitude,
        longitude: longitude,
        appId: kAPI_KEY);
    var weatherData = await networkHelper.getData();
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
