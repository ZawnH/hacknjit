import 'package:flutter/material.dart';
import '../model/forecastdata.dart';

class DetailsPage extends StatelessWidget {
  final ForecastData forecastData;

  DetailsPage({Key? key, required this.forecastData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      
    );
  }
}

