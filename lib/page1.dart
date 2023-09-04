import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationScreen(),
    );
  }
}

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _locationMessage = "";

  @override
  void initState() {
    super.initState();
   // _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_locationMessage),
          ],
        ),
      ),
    );
  }
}






              // Container(
              //   margin: EdgeInsets.all(16.0),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(12.0),
              //     color: Colors
              //         .white, // Change this color to your desired background color
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.withOpacity(0.5),
              //         spreadRadius: 2,
              //         blurRadius: 5,
              //         offset: Offset(0, 3),
              //       ),
              //     ],
              //   ),
              //   child: Column(
              //     children: <Widget>[
              //       Container(
              //         margin: EdgeInsets.all(8), // Adjust margin as needed
              //         child: ClipRRect(
              //           borderRadius: BorderRadius.all(Radius.circular(12)),
              //           child: Container(
              //             color: Colors
              //                 .white, // Add a background color for the image frame
              //             child: Image.asset(
              //               'assets/images/lapor.png',
              //               fit: BoxFit.cover,
              //               height: 200.0, // Adjust the height as needed
              //             ),
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(16.0),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: <Widget>[
              //             Text(
              //               'Card Title',
              //               style: TextStyle(
              //                 fontSize: 20.0,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //             SizedBox(height: 8.0),
              //             Text(
              //               '123 Main Street, City, Country',
              //               style: TextStyle(
              //                 fontSize: 16.0,
              //                 color: Colors.grey,
              //               ),
              //             ),
              //             SizedBox(height: 16.0),
              //             ElevatedButton(
              //               onPressed: () {
              //                 // Handle button press
              //               },
              //               child: Text('Click Me'),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),