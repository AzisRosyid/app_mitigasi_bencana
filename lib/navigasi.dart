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
  Location selectedLocation = getLocations[1];
  bool _isBottomPopupVisible = false;
  BitmapDescriptor markerIconType1 = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIconType2 = BitmapDescriptor.defaultMarker;
  // Create custom marker icons for each type

  void _toggleBottomPopup() {
    setState(() {
      _isBottomPopupVisible = !_isBottomPopupVisible; // Toggle popup visibility
    });
  }

  void _showPosition(LatLng position) {
    setState(() {
      _isBottomPopupVisible = true;

      // Find the selected location based on the tapped position
      selectedLocation = getLocations.firstWhere(
        (location) =>
            location.latitude == position.latitude &&
            location.longitude == position.longitude,
      );
    });
  }

  void _hideBottomPopup() {
    setState(() {
      _isBottomPopupVisible = false; // Hide the bottom popup
    });
  }

  void _addMarkers() async {
    await _setMarkerIcons();

    for (int i = 0; i < getLocations.length; i++) {
      Location location = getLocations[i];
      LatLng locationPosition = LatLng(location.latitude, location.longitude);

      BitmapDescriptor markerIcon;
      switch (location.type) {
        case 1:
          markerIcon = markerIconType1;
          break;
        case 2:
          markerIcon = markerIconType2;
          break;
        default:
          markerIcon = markerIconType1;
      }

      _markers.add(
        Marker(
          markerId: MarkerId('marker$i'),
          position: locationPosition,
          icon: markerIcon,
          infoWindow: InfoWindow(title: location.name),
          onTap: () => _showPosition(locationPosition),
        ),
      );
    }
  }

  Future<void> _setMarkerIcons() async {
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size.zero),
            'assets/images/location_type1.png')
        .then((icon) {
      setState(() {
        markerIconType1 = icon;
      });
    });
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size.zero),
            'assets/images/location_type2.png')
        .then((icon) {
      setState(() {
        markerIconType2 = icon;
      });
    });
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

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _fetchPolyline() {
    // Fetching polyline code remains the same
  }

  Widget _buildBottomPopup() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      bottom: _isBottomPopupVisible ? 0 : -335, // Position based on visibility
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {
          if (_isBottomPopupVisible) {
            _hideBottomPopup();
          } else {
            _toggleBottomPopup();
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Container(
            height: 335,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: EdgeInsets.all(8),
            child: selectedLocation != null
                ? LocationCard(location: selectedLocation!, navigasiState: this,)
                : Text('No location selected'),
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
                _hideBottomPopup();
              },
            ),
          ),
          _buildBottomPopup(),
        ],
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  final Location location;
  final _NavigasiState navigasiState;

  LocationCard({required this.location, required this.navigasiState});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(4),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Informasi',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    color: Color(0xFF930000), // Color of the line
                    thickness: 1.5, // Adjust the thickness as needed
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(right: 8, left: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Image.asset('assets/images/phone.png'),
                          SizedBox(width: 8.0),
                          Text(
                            location.phone,
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ]),
                        SizedBox(height: 8.0),
                        Text(
                          "Ketersediaan",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 6.0),
                        Row(children: [
                          SizedBox(width: 3.0),
                          Image.asset(
                            'assets/images/water.png',
                            width: 14,
                          ),
                          SizedBox(width: 11.0),
                          Text(
                            '${location.water} Liter',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ]),
                        SizedBox(height: 4.0),
                        Row(children: [
                          Image.asset(
                            'assets/images/food.png',
                            width: 20,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            location.availability,
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ]),
                        SizedBox(height: 4.0),
                        Row(children: [
                          Image.asset(
                            'assets/images/clothes.png',
                            width: 20,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            '${location.people} Orang',
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ]),
                        SizedBox(height: 8.0),
                        Text(
                          "Akses Tersedia",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 6.0),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/images/motor.png',
                                width: 50,
                              ),
                              SizedBox(width: 8.0),
                              Image.asset(
                                'assets/images/car.png',
                                width: 40,
                              ),
                              SizedBox(width: 8.0),
                              Image.asset(
                                'assets/images/truck.png',
                                width: 40,
                              ),
                              SizedBox(width: 8.0),
                            ]),
                        SizedBox(height: 12),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      navigasiState._toggleBottomPopup();
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF930000)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Adjust the radius as needed
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(
                          Size(double.infinity, 38.0)), // Full width button
                    ),
                    child: Text(
                      "Lokasi",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
