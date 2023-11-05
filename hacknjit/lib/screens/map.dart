import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../controllers/global_controller.dart';
import '../widgets/popup_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  LatLng? _center; // Initially null

  @override
  void initState() {
    super.initState();
    _determinePosition(); // Call this method to determine the position
  }

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
    setState(() {
      _center = LatLng(position.latitude, position.longitude);
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onMapTapped(LatLng coords) {
    Provider.of<GlobalController>(context, listen: false)
        .updateCoordinates(coords.latitude, coords.longitude);
    PopupWidget.showWeatherDialog(context, coords.latitude, coords.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: const Text('FishermenDual'),
        elevation: 2,
      ),
      body: _center == null
          ? const Center(
              child:
                  CircularProgressIndicator()) // Show loading indicator while waiting for location
          : GoogleMap(
              onMapCreated: _onMapCreated,
              onTap: _onMapTapped,
              initialCameraPosition: CameraPosition(
                target: _center!,
                zoom: 11.0,
              ),
            ),
    );
  }
}
