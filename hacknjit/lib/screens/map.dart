import 'package:flutter/material.dart';
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
  final LatLng _center = const LatLng(38.0797513, -66.2764865);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

 void _onMapTapped(LatLng coords) {
  Provider.of<GlobalController>(context, listen: false).updateCoordinates(coords.latitude, coords.longitude);

  PopupWidget.showWeatherDialog(context, coords.latitude, coords.longitude);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nautical Safety'),
        elevation: 2,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        onTap: _onMapTapped,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
