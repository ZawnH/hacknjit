import 'package:flutter/material.dart';
import '../api/fetch_weather.dart';
import '../model/forecastdata.dart';

class GlobalController extends ChangeNotifier {
  double? _latitude;
  double? _longitude;
  ForecastData? _forecastData;

  double? get latitude => _latitude;
  double? get longitude => _longitude;
  ForecastData? get forecastData => _forecastData;

  final fetchWeatherApi = FetchWeatherAPI();

  void updateCoordinates(double latitude, double longitude) {
    _latitude = latitude;
    _longitude = longitude;
    notifyListeners();
  }

}
