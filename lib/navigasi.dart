import 'dart:io';

import 'package:app_mitigasi_bencana/data/place.dart';
import 'package:app_mitigasi_bencana/data/zone.dart';
import 'package:app_mitigasi_bencana/helper.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class Navigasi extends StatefulWidget {
  @override
  _NavigasiState createState() => _NavigasiState();
}

class _NavigasiState extends State<Navigasi> {
  late GoogleMapController _mapController;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  Place? selectedPlace;
  bool _isBottomPopupVisible = false;
  bool _isLocationPoly = false;
  BitmapDescriptor markerIconType1 = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIconType2 = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentIcon = BitmapDescriptor.defaultMarker;
  // Create custom marker icons for each type

  void _toggleBottomPopup() {
    setState(() {
      _isBottomPopupVisible = !_isBottomPopupVisible; // Toggle popup visibility
    });
  }

  Place? polylinePlace = null;
  Marker? targetMarker = null;

  void _setPolyline() {
    polylinePlace = selectedPlace;
    targetMarker = Marker(
        markerId: MarkerId('targetLocation'),
        position: LatLng(polylinePlace!.latitude, polylinePlace!.longitude),
        infoWindow: InfoWindow(title: 'Target Location'),
        icon: currentIcon,
        anchor: Offset(.5, .5),
        onTap: () {
          _onTargetTap();
          _hideBottomPopup();
        });
    _loadPolyline();
  }

  void _loadPolyline() {
    _polylines.clear();
    _polylines.add(Polyline(
      polylineId: PolylineId('route'),
      color: Color(0xFFCD0000),
      points: [
        LatLng(currentPosition!.latitude, currentPosition!.longitude),
        LatLng(polylinePlace!.latitude, polylinePlace!.longitude)
      ],
      width: 5, // Adjust polyline width as needed
    ));
    _isLocationPoly = true;
  }

  void _showPosition(LatLng position) {
    setState(() {
      _isBottomPopupVisible = true;

      // Find the selected location based on the tapped position
      selectedPlace = getPlaces.firstWhere(
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

    for (int i = 0; i < getPlaces.length; i++) {
      Place location = getPlaces[i];
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
          anchor: Offset(.5, .5),
          onTap: () {
            _showPosition(locationPosition);
            double newZoom = 16;
            _mapController.animateCamera(CameraUpdate.newLatLngZoom(
              LatLng(locationPosition.latitude - 0.003,
                  locationPosition.longitude),
              newZoom,
            ));
          },
        ),
      );
    }
  }

  Future<void> _setMarkerIcons() async {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(30, 30)),
            'assets/images/location_type1.png')
        .then((icon) {
      setState(() {
        markerIconType1 = icon;
      });
    });
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(30, 30)),
            'assets/images/location_type2.png')
        .then((icon) {
      setState(() {
        markerIconType2 = icon;
      });
    });
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(30, 30)),
            'assets/images/current.png')
        .then((icon) {
      setState(() {
        currentIcon = icon;
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
          radius: zone.radius * 1000, // Use the radius from the Zone object
          strokeWidth: 1,
          strokeColor: _getCircleStrokeColor(
              zone.type), // Function to get stroke color based on zone type
          fillColor: _getCircleFillColor(zone.type),
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
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _addMarkers();
    _addCircles();
    _startTimer();
    if (startPlace != null) {
      selectedPlace = startPlace;
      _toggleBottomPopup();
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  // Function to start the timer
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      _getLocation();
      if (_isLocationPoly) _loadPolyline();
    });
  }

  // Function to stop the timer when the screen is disposed
  void _stopTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _stopTimer(); // Stop the timer when the screen is disposed to prevent memory leaks
  }

  String _locationMessage = "";
  Future<void> _getLocation() async {
    // Request location permission
    var status = await Permission.location.request();

    if (status.isGranted) {
      // Get the location and address
      var locationData = await getLocationData();
      setState(() {
        _locationMessage = locationData;
      });
    } else {
      setState(() {
        _locationMessage = "Location permission denied";
      });
    }
  }

  Future<String> getLocationData() async {
    try {
      // Get current position using Geolocator
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Get address information using Geocoding
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      // Update the map location
      setState(() {
        currentPosition = position;
      });

      // Construct the location message
      return "Latitude: ${position.latitude}, Longitude: ${position.longitude}\n" +
          "Address: ${placemarks[0].name}, ${placemarks[0].subLocality}, ${placemarks[0].locality}, ${placemarks[0].administrativeArea}, ${placemarks[0].country}";
    } catch (e) {
      return "Error fetching location data: $e";
    }
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
            child: selectedPlace != null
                ? PlaceCard(
                    place: selectedPlace!,
                    navigasiState: this,
                  )
                : Text('No location selected'),
          ),
        ),
      ),
    );
  }

  bool _isAlertDialogVisible = false;

  // Function to show the AlertDialog
  void _showAlertDialog() {
    setState(() {
      _isAlertDialogVisible = true;
    });
  }

  // Function to hide the AlertDialog
  void _hideAlertDialog() {
    setState(() {
      _isAlertDialogVisible = false;
    });
  }

  Widget _buildAlertDialog() {
    return Stack(
      children: [
        // Modal barrier for the darkened background
        ModalBarrier(
          color: Colors.black.withOpacity(0.5), // Adjust the opacity as needed
          dismissible: false,
        ),
        // Centered GestureDetector wrapped AlertDialog
        Center(
          child: Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .08,
                bottom: MediaQuery.of(context).size.height * .19),
            child: GestureDetector(
              onTap: () {
                _hideAlertDialog(); // Hide the AlertDialog when tapped
              },
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                content: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Legenda Peta',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            color: Color(0xFF930000), // Color of the line
                            thickness: 1.5, // Adjust the thickness as needed
                          ),
                          SizedBox(height: 14.0),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(right: 8, left: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Image.asset(
                                    'assets/images/location_type1.png',
                                    width: 30,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    "Shelter",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ]),
                                SizedBox(height: 12.0),
                                Row(children: [
                                  Image.asset(
                                    'assets/images/location_type2.png',
                                    width: 30,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    "Titik Kumpul",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ]),
                                SizedBox(height: 12.0),
                                Row(children: [
                                  Image.asset(
                                    'assets/images/current.png',
                                    width: 30,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    "Lokasi Saat Ini",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ]),
                                SizedBox(height: 12.0),
                                Row(children: [
                                  Image.asset(
                                    'assets/images/zone1.png',
                                    width: 30,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    "Zona Aman",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ]),
                                SizedBox(height: 12.0),
                                Row(children: [
                                  Image.asset(
                                    'assets/images/zone2.png',
                                    width: 30,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    "Zona Siaga",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ]),
                                SizedBox(height: 12.0),
                                Row(children: [
                                  Image.asset(
                                    'assets/images/zone3.png',
                                    width: 30,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    "Zona Bahaya",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ]),
                                SizedBox(height: 14.0),
                                Row(children: [
                                  Image.asset(
                                    'assets/images/motor.png',
                                    width: 30,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    "Akses Motor",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ]),
                                SizedBox(height: 16.0),
                                Row(children: [
                                  Image.asset(
                                    'assets/images/car.png',
                                    width: 30,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    "Akses Mobil",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ]),
                                SizedBox(height: 12.0),
                                Row(children: [
                                  Image.asset(
                                    'assets/images/truck.png',
                                    width: 30,
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    "Akses Truk",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                ]),
                                SizedBox(height: 12.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> openGoogleMaps() async {
    final Uri googleMapsUrl = Uri.parse(
        'https://www.google.com/maps/dir/${currentPosition!.latitude},${currentPosition!.longitude}/${selectedPlace!.latitude},${selectedPlace!.longitude}/');

    await launchUrl(googleMapsUrl);
  }

  void _onCurrentTap() {
    double newZoom = 16;
    _mapController.animateCamera(CameraUpdate.newLatLngZoom(
      LatLng(currentPosition!.latitude, currentPosition!.longitude),
      newZoom,
    ));
  }

  void _onTargetTap() {
    double newZoom = 16;
    _mapController.animateCamera(CameraUpdate.newLatLngZoom(
      LatLng(targetMarker!.position.latitude, targetMarker!.position.longitude),
      newZoom,
    ));
  }

  void _onLocationTap() {
    double newZoom = 16;
    _mapController
        .animateCamera(CameraUpdate.newLatLngZoom(
      LatLng(currentPosition!.latitude, currentPosition!.longitude),
      newZoom,
    ))
        .then((value) {
      // Delay for 2 seconds before calling openGoogleMaps
      Future.delayed(Duration(seconds: 1, milliseconds: 500), () {
        openGoogleMaps();
      });
    });
  }

  Widget build(BuildContext context) {
    _markers.add(
      Marker(
          markerId: MarkerId('userLocation'),
          position: LatLng(currentPosition?.latitude ?? 0.0,
              currentPosition?.longitude ?? 0.0),
          infoWindow: InfoWindow(title: 'My Location'),
          icon: currentIcon,
          anchor: Offset(.5, .5),
          onTap: () {
            _onCurrentTap();
            _hideBottomPopup();
          }),
    );
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
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(
                    Icons.info), // You can change the icon to your desired one
                onPressed: () {
                  _showAlertDialog(); // Show the AlertDialog when the button is pressed
                },
              ),
            ],
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
            initialCameraPosition: (startPlace == null)
                ? CameraPosition(
                    target: LatLng(currentPosition?.latitude ?? 0.0,
                        currentPosition?.longitude ?? 0.0),
                    zoom: 16,
                  )
                : CameraPosition(
                    target: LatLng(
                        startPlace!.latitude - 0.003, startPlace!.longitude),
                    zoom: 16,
                  ),
            markers: _markers,
            polylines: _polylines,
            circles: _circles,
            
          ),
          Positioned.fill(
            child: Listener(
              onPointerDown: (_) {
                _hideBottomPopup();
              },
            ),
          ),
          _buildBottomPopup(),
          if (_isAlertDialogVisible)
            _buildAlertDialog(), // Show the AlertDialog if _isAlertDialogVisible is true
        ],
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final Place place;
  final _NavigasiState navigasiState;

  PlaceCard({required this.place, required this.navigasiState});

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
                            place.phone,
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
                            '${place.water} Liter',
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
                            place.availability,
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
                            '${place.people} Orang',
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
                            Visibility(
                              visible: place.access.contains(1),
                              child: Image.asset(
                                'assets/images/motor.png',
                                width: 50,
                              ),
                            ),
                            Visibility(
                              visible: place.access.contains(1),
                              child: SizedBox(width: 8.0),
                            ),
                            Visibility(
                              visible: place.access.contains(2),
                              child: Image.asset(
                                'assets/images/car.png',
                                width: 40,
                              ),
                            ),
                            Visibility(
                              visible: place.access.contains(2),
                              child: SizedBox(width: 8.0),
                            ),
                            Visibility(
                              visible: place.access.contains(3),
                              child: Image.asset(
                                'assets/images/truck.png',
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      navigasiState._toggleBottomPopup();
                      navigasiState._setPolyline();
                      navigasiState._onLocationTap();
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
