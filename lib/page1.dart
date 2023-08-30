import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController _mapController;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  LatLng _tappedPosition = LatLng(0.0, 0.0); // Holds the tapped position

  bool _isBottomPopupVisible = false;

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

  Set<Circle> _circles = {};

  void _addCircles() {
    _circles.add(
      Circle(
        circleId: CircleId('circle1'),
        center: _marker1Position,
        radius: 2000, // 2 km in meters
        strokeWidth: 1,
        strokeColor: Colors.blue,
        fillColor: Colors.blue.withOpacity(0.2),
      ),
    );
    _circles.add(
      Circle(
        circleId: CircleId('circle2'),
        center: _marker2Position,
        radius: 2000, // 2 km in meters
        strokeWidth: 1,
        strokeColor: Colors.green,
        fillColor: Colors.green.withOpacity(0.2),
      ),
    );
  }

  final LatLng _marker1Position = LatLng(37.7749, -122.4194);
  final LatLng _marker2Position = LatLng(37.6788, -122.1350);

  @override
  void initState() {
    super.initState();
    _addMarkers();
    _fetchPolyline();
    _addCircles();
  }

  void _addMarkers() {
    _markers.add(
      Marker(
        markerId: MarkerId('marker1'),
        position: _marker1Position,
        infoWindow: InfoWindow(title: 'Marker 1'),
        onTap: () => _showPosition(_marker1Position),
      ),
    );
    _markers.add(
      Marker(
        markerId: MarkerId('marker2'),
        position: _marker2Position,
        infoWindow: InfoWindow(title: 'Marker 2'),
        onTap: () => _showPosition(_marker2Position),
      ),
    );
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
      appBar: AppBar(
        title: Text('Google Map with Markers, Polylines, and Circles'),
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

void main() => runApp(MaterialApp(home: MapPage()));
