import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/forecastdata.dart';
import '../model/marineforecast.dart';
import '../model/weatherforecast.dart';

class FetchWeatherAPI {
  ForecastData? forecastData;

  Future<ForecastData?> processData(double lat, double lon) async {
    final String apiUrl1 = apiURL1(lat, lon);
    final String apiUrl2 = apiURL2(lat, lon);

    var response1 = await http.get(Uri.parse(apiUrl1));
    var response2 = await http.get(Uri.parse(apiUrl2));

    if (response1.statusCode == 200 && response2.statusCode == 200) {
      var data1 = jsonDecode(response1.body); 
      var data2 = jsonDecode(response2.body); 

      forecastData = ForecastData(
        marine: MarineForecast.fromJson(data1),
        weather: WeatherForecast.fromJson(data2),
      );

      print(forecastData);
      return forecastData;
    } else {
      return null;
    }
  }

  // ... rest of your code ...
}

String apiURL1(double lat, double lon) {
  return "https://marine-api.open-meteo.com/v1/marine?latitude=$lat&longitude=$lon&current=wave_height&hourly=wave_height";
}

String apiURL2(double lat, double lon) {
  return "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m,windspeed_10m&hourly=temperature_2m,windspeed_10m";
}
