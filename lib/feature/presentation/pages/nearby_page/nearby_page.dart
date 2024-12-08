import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyPage extends StatefulWidget {
  const NearbyPage({super.key});

  @override
  State<NearbyPage> createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  late GoogleMapController _mapController;

  final List<LatLng> _locations = [
    const LatLng(49.91, 69.101), // San Francisco
    const LatLng(49.899, 69.091), // Los Angeles
    const LatLng(49.88, 69.15),
    const LatLng(49.8, 69.1), // New York
// New York
  ];

  final List<LatLng> heatmapPoints = [
    const LatLng(49.8, 69.1), // New York
// New York
  ];
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _initializeMarkers();
  }

  void _initializeMarkers() {
    for (int i = 0; i < _locations.length; i++) {
      _markers.add(
        Marker(
          markerId: MarkerId('marker_$i'),
          position: _locations[i],
          infoWindow: InfoWindow(
            title: 'Marker $i',
            snippet:
                'Lat: ${_locations[i].latitude}, Lng: ${_locations[i].longitude}',
          ),
        ),
      );
    }
    setState(() {});
  }

  CameraPosition cameraPosition= const CameraPosition(
      target: LatLng(49.9, 69.1),
      zoom: 5
  );
  final Set<Circle> _heatmapCircles = {};
  void _initializeHeatmap() {
    for (int i = 0; i < heatmapPoints.length; i++) {
      _heatmapCircles.add(
        Circle(
          circleId: CircleId('circle_$i'),
          center: heatmapPoints[i],
          zIndex: 1 ,
          radius: 10000, // Adjust radius for visibility
          fillColor: Colors.green,
          visible: true,
          consumeTapEvents: true,
          strokeColor: Colors.red,// Heatmap color
          strokeWidth: 0,
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: cameraPosition,
        style: "12",
        onTap: (argument) {
          print(argument);
        },
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        myLocationButtonEnabled: true,
        mapToolbarEnabled: true,
        mapType: MapType.normal,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        compassEnabled: true,
        fortyFiveDegreeImageryEnabled: true,
        buildingsEnabled: true,
        myLocationEnabled: true,
        onCameraMove: (position) {
          setState(() {
            cameraPosition=position;
          });
        },
        circles: _heatmapCircles,
        rotateGesturesEnabled: true,
        tiltGesturesEnabled: true,
        markers: _markers,
      ),
    );
  }
}
