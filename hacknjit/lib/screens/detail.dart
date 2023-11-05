import 'package:flutter/material.dart';

import '../model/forecastdata.dart';
import '../widgets/listview_widget.dart';

class DetailsPage extends StatelessWidget {
  final ForecastData forecastData;
  late final marine = forecastData.marine;
  late final weather = forecastData.weather;
  late final List<double>? waveHeight = marine.hourly?.waveHeight?.cast<double>();
  late final List<double>? temperature2m = weather.hourly?.temperature2m?.cast<double>();
  late final List<double>? windspeed10m = weather.hourly?.windspeed10m?.cast<double>();

  DetailsPage({Key? key, required this.forecastData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: const Text('Details', style: TextStyle(fontWeight: FontWeight.w500),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListViewWidget(data: waveHeight!.take(24).toList(), title: 'Wave Height (m)'),
          ),
          Expanded(
            child: ListViewWidget(data: temperature2m!.take(24).toList(), title: 'Temperature (°C)'),
          ),
          Expanded(
            child: ListViewWidget(data: windspeed10m!.take(24).toList(), title: 'Wind Speed (m/s)'),
          ),
        ]
      )
    );
  }
}
