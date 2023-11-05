import 'package:flutter/material.dart';
import '../api/fetch_weather.dart';
import '../model/forecastdata.dart';
import '../screens/detail.dart';

class PopupWidget {
  static void showWeatherDialog(BuildContext context, double lat, double lon) {
    var fetchWeatherAPI = FetchWeatherAPI();
    ForecastData? forecastData; // Variable to hold the forecast data

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text('Weather Info'),
            content: FutureBuilder<ForecastData?>(
              future: fetchWeatherAPI.processData(lat, lon),
              builder: (BuildContext context,
                  AsyncSnapshot<ForecastData?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return const Text('No data found.');
                } else {
                  // Update the variable when data is available
                  forecastData = snapshot.data;
                  final marineForecast = forecastData!.marine;
                  final weatherForecast = forecastData!.weather;
                  final waveHeight = marineForecast.current!.waveHeight;
                  final temperature = weatherForecast.current!.temperature2m;
                  final windspeed = weatherForecast.current!.windspeed10m;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Wave Height: ${waveHeight}m'),
                      Text('Temperature: $temperature°C'),
                      Text('Wind Speed: $windspeed m/s')
                      // Add more data display as needed
                    ],
                  );
                }
              },
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // This will space out your buttons across the row
                children: [
                  TextButton(
                    child: const Text('See Details'),
                    onPressed: () {
                      // Check if the forecastData variable is not null
                      if (forecastData != null) {
                        // Close the dialog first
                        Navigator.of(context).pop();
                        // Navigate to DetailsPage with the available forecastData
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DetailsPage(forecastData: forecastData!),
                        ));
                      }
                    },
                  ),
                  TextButton(
                    child: const Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ]);
      },
    );
  }
}
