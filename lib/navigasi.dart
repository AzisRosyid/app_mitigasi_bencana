import 'package:app_mitigasi_bencana/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class Navigasi extends StatefulWidget {
  const Navigasi({super.key});

  @override
  State<Navigasi> createState() => MapSampleState();
}

class MapSampleState extends State<Navigasi> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const LatLng sourceLocation = LatLng(-7.795580, 110.369492);
  static const LatLng destination = LatLng(-7.795780, 110.359492);

  final Set<Polyline> polylines = {};

  void createPolylines() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    if (result.points.isNotEmpty) {
      List<LatLng> polylineCoordinates = [];
      result.points.forEach(
        (PointLatLng point) =>
            polylineCoordinates.add(LatLng(point.latitude, point.longitude)),
      );

      setState(() {
        polylines.add(
          Polyline(
            polylineId: PolylineId('route'),
            color: Colors.blue,
            points: polylineCoordinates,
            width: 5,
          ),
        );
      });
    }
  }

  final Set<Marker> markers = {};
  int markerId = 0;
  bool isMarkerTapped = false;

  void onMarkerTapped(int id) {
    setState(() {
      markerId = id - 1;
      isMarkerTapped = true;
    });
  }

  @override
  void initState() {
    markers.add(
      Marker(
        markerId: MarkerId("source"),
        position: sourceLocation,
        onTap: () => onMarkerTapped(1),
      ),
    );

    markers.add(
      Marker(
        markerId: MarkerId("destination"),
        position: destination,
        onTap: () => onMarkerTapped(2),
      ),
    );

    createPolylines();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Navigasi oldWidget) {
    super.didUpdateWidget(oldWidget);
    createPolylines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peta Navigasi"),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: sourceLocation, zoom: 14.5),
            polylines: polylines,
            markers: markers.toSet(),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          if (isMarkerTapped && markerId >= 0)
            Positioned(
              top: 16, // Adjust the position as needed
              right: 16, // Adjust the position as needed
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Text(
                  'Latitude: ${markers.toList()[markerId].position.latitude.toStringAsFixed(6)}\n'
                  'Longitude: ${markers.toList()[markerId].position.longitude.toStringAsFixed(6)}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
