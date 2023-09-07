import 'package:app_mitigasi_bencana/helper.dart';
import 'package:app_mitigasi_bencana/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      _navigateToLocationPermissionHandler(); // Navigate to LocationPermissionHandler
    });
  }

  void _navigateToLocationPermissionHandler() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LocationPermissionHandler(),
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB60000),
              Color(0xFF350000),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Edu MIT',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontFamily: 'Knewave',
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Aplikasi Edukasi dan Mitigasi Bencana',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontFamily: 'Inter',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LocationPermissionHandler extends StatefulWidget {
  @override
  _LocationPermissionHandlerState createState() =>
      _LocationPermissionHandlerState();
}

class _LocationPermissionHandlerState extends State<LocationPermissionHandler> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    var status = await Permission.location.request();

    if (status.isGranted) {
      // Get the location and address
      var locationData = await getLocationData();
      print('Location permission granted. Navigating to Home screen.');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Home(); // Redirect to the Home screen
      }));
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Location Permission Required'),
            content: Text('Please grant location permission to use this app.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB60000),
              Color(0xFF350000),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Edu MIT',
              style: TextStyle(
                fontSize: 45,
                color: Colors.white,
                fontFamily: 'Knewave',
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Aplikasi Edukasi dan Mitigasi Bencana',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: 'Inter',
              ),
            )
          ],
        ),
      ),
    );
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

}
