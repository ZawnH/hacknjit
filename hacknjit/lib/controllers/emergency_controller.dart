import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cron/cron.dart';
import 'package:geolocator/geolocator.dart';

Future <void> emergencyOcc() async {
  final cron = Cron();
  String cronExpression = "0 */2 * * *";
  int k = 1;
  cron.schedule(Schedule.parse(cronExpression), ()async{
    Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled.
      // Handle it appropriately by prompting the user to enable it.
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        // Permissions are denied, handle appropriately.
        return;
      }
    }

    // When permissions are granted, proceed to get the current position.
    Position position = await Geolocator.getCurrentPosition();

    print(position.latitude);
    print(position.longitude);
    var docUser  = FirebaseFirestore.instance.collection("address").doc("Time: $k");
    var json = {
        'latitude': position.latitude, 
        'longtitude': position.longitude,
    };
    await docUser.set(json);
  }
  k++;
  });
}