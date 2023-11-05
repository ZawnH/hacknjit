import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  final List<double>? data;
  final String title;

  const ListViewWidget({
    Key? key,
    required this.data,
    required this.title,
  }) : super(key: key);

  String formatHour(int hour) {
    // Formats the hour in a 24-hour format with leading zeros if necessary.
    return "${hour.toString().padLeft(2, '0')}:00";
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Center(child: Text('No data available for $title'));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data!.length,
            itemBuilder: (context, index) {
              // Creating a card with time and data.
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  width: 100.0,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(formatHour(index + 1), // Display the hour
                          style: const TextStyle(fontSize: 16)),
                      SizedBox(height: 8), // Spacing between the hour and the data
                      Text('${data![index].toStringAsFixed(1)}', // Display the data
                          style: const TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
