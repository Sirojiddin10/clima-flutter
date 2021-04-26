import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(
      {this.url,
      this.unencodedPath,
      this.latitude,
      this.longitude,
      this.appId,
      this.city});
  final String url;
  String city;
  final String unencodedPath;
  double latitude;
  double longitude;
  final String appId;
  Future getCityWeatherData() async {
    http.Response response = await http.get(
      Uri.https(
        url,
        unencodedPath,
        {
          'q': city,
          'appid': appId,
          'units': 'metric',
        },
      ),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      var dataCode = jsonDecode(data);
      return dataCode;
    } else {
      print(response.statusCode);
    }
  }

  Future getData() async {
    http.Response response = await http.get(
      Uri.https(
        url,
        unencodedPath,
        {
          'lat': '$latitude',
          'lon': '$longitude',
          'appid': appId,
          'units': 'metric'
        },
      ),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      var dataCode = jsonDecode(data);
      return dataCode;
    } else {
      print(response.statusCode);
    }
  }
}
