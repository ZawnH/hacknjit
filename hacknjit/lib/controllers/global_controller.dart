import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../api/fetch_weather.dart';
import '../model/forecastdata.dart';

class GlobalController extends ChangeNotifier {
  double? _latitude;
  double? _longitude;
  ForecastData? _forecastData;

  double? get latitude => _latitude;
  double? get longitude => _longitude;
  ForecastData? get forecastData => _forecastData;

  final FetchWeatherAPI fetchWeatherApi = FetchWeatherAPI();

  void updateCoordinates(double latitude, double longitude) {
    _latitude = latitude;
    _longitude = longitude;
    notifyListeners();
  }

  Future<void> getUserLocation() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      updateCoordinates(position.latitude, position.longitude);
    // ignore: empty_catches
    } on Exception {
    }
  }
}
