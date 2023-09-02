import 'dart:typed_data';
import 'dart:ui';

import 'package:app_mitigasi_bencana/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class Navigasi extends StatefulWidget {
  @override
  _NavigasiState createState() => _NavigasiState();
}

class _NavigasiState extends State<Navigasi> {
  late GoogleMapController _mapController;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  LatLng _tappedPosition = LatLng(0.0, 0.0); // Holds the tapped position
  bool _isBottomPopupVisible = false;
  // Create custom marker icons for each type
  final BitmapDescriptor markerIconType1 =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
  final BitmapDescriptor markerIconType2 =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
// Add more if needed for other types

  void _toggleBottomPopup(LatLng position) {
    setState(() {
      _tappedPosition = position;
      _isBottomPopupVisible = !_isBottomPopupVisible; // Toggle popup visibility
    });
  }

  void _showPosition(LatLng position) {
    setState(() {
      _tappedPosition = position;
      _isBottomPopupVisible = true; // Show the bottom popup
    });
  }

  void _hideBottomPopup() {
    setState(() {
      _isBottomPopupVisible = false; // Hide the bottom popup
    });
  }

  Future<Uint8List> getResizedMarkerIconFromAssets(
      String path, int width, int height) async {
    final ByteData data = await rootBundle.load(path);
    final Uint8List bytes = data.buffer.asUint8List();
    final codec = await instantiateImageCodec(bytes,
        targetHeight: height, targetWidth: width);
    final frameInfo = await codec.getNextFrame();
    final resizedBytes =
        await frameInfo.image.toByteData(format: ImageByteFormat.png);

    return resizedBytes!.buffer.asUint8List();
  }

void _addMarkers() {
  final int iconSize = 48; // Set the desired size for the icons (in pixels)

  for (int i = 0; i < getLocations.length; i++) {
    Location location = getLocations[i];
    LatLng locationPosition = LatLng(location.latitude, location.longitude);

    String iconPath;
    switch (location.type) {
      case 1:
        iconPath = 'assets/marker_icons/marker_type1.png';
        break;
      case 2:
        iconPath = 'assets/marker_icons/marker_type2.png';
        break;
      default:
        iconPath = 'assets/marker_icons/default.png'; // Provide a default icon
    }

    _markers.add(
      Marker(
        markerId: MarkerId('marker$i'),
        position: locationPosition,
        icon: BitmapDescriptor.fromAsset(
          iconPath,
          // Set the desired width and height for the icon
          size: Size(iconSize.toDouble(), iconSize.toDouble()),
        ),
        infoWindow: InfoWindow(title: location.name),
        onTap: () => _showPosition(locationPosition),
      ),
    );
  }
}

  void _addCircles() {
    for (int i = 0; i < getZones.length; i++) {
      Zone zone = getZones[i];
      LatLng zonePosition = LatLng(zone.latitude, zone.longitude);

      _circles.add(
        Circle(
          circleId: CircleId('circle$i'), // Use a unique circle ID
          center: zonePosition,
          radius: zone.radius * 200, // Use the radius from the Zone object
          strokeWidth: 1,
          strokeColor: _getCircleStrokeColor(
              zone.type), // Function to get stroke color based on zone type
          fillColor: _getCircleFillColor(
              zone.type), // Function to get fill color based on zone type
        ),
      );
    }
  }

  Color _getCircleStrokeColor(int zoneType) {
    // Implement logic to return the stroke color based on zoneType
    // For example:
    switch (zoneType) {
      case 1:
        return Colors.green;
      case 2:
        return Colors.yellow;
      case 3:
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  Color _getCircleFillColor(int zoneType) {
    // Implement logic to return the fill color based on zoneType
    // For example:
    switch (zoneType) {
      case 1:
        return Colors.blue.withOpacity(0.2);
      case 2:
        return Colors.green.withOpacity(0.2);
      case 3:
        return Colors.red.withOpacity(0.2);
      default:
        return Colors.blue.withOpacity(0.2);
    }
  }

  Set<Circle> _circles = {};

  final LatLng _marker1Position = LatLng(37.7749, -122.4194);
  final LatLng _marker2Position = LatLng(37.6788, -122.1350);

  @override
  void initState() {
    super.initState();
    _addMarkers();
    _fetchPolyline();
    _addCircles();
  }

  @override
  void didUpdateWidget(covariant Navigasi oldWidget) {
     _addMarkers();
    _fetchPolyline();
    _addCircles();
    super.didUpdateWidget(oldWidget);
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _fetchPolyline() {
    // Fetching polyline code remains the same
  }

  Widget _buildBottomPopup() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      bottom: _isBottomPopupVisible ? 0 : -150, // Position based on visibility
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {
          if (_isBottomPopupVisible) {
            _hideBottomPopup();
          } else {
            _toggleBottomPopup(_tappedPosition);
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // Shadow offset
                ),
              ],
            ),
            padding: EdgeInsets.all(16),
            child: Text(
              'Latitude: ${_tappedPosition.latitude.toStringAsFixed(6)}, '
              'Longitude: ${_tappedPosition.longitude.toStringAsFixed(6)}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(60), // Set the preferred height of the AppBar
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF930000), Color(0xFFC30000)], // Gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20), // Adjust the radius as needed
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent, // Make AppBar transparent
            elevation: 0, // Remove the shadow
            leading: GestureDetector(
              onTap: () {
                // Handle back button action here
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
                child: Image.asset(
                  'assets/images/back.png', // Replace with your custom image asset path
                  width: 24, // Adjust the width as needed
                  height: 24, // Adjust the height as needed
                ),
              ),
            ),
            title: Text(
              "Peta Navigasi",
              style: TextStyle(
                  color: Colors.white, // Set text color to white
                  fontSize: 20, // Adjust font size as needed
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true, // Center the title horizontally
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _marker1Position,
              zoom: 10,
            ),
            markers: _markers,
            polylines: _polylines,
            circles: _circles, // Add circles to the map
          ),
          Positioned.fill(
            child: Listener(
              onPointerDown: (_) {
                _hideBottomPopup(); // Hide the popup on map pointer down
              },
            ),
          ),
          _buildBottomPopup(),
        ],
      ),
    );
  }
}
