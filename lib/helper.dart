import 'dart:io';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

const String google_api_key = "AIzaSyBik0QAgip4imXCI1gIRHVjLtytKMdxX0c";
const double defaultPadding = 16.0;

final List<Book> getBooks = [
  Book(
      title: 'A House Divided',
      author: 'Nicole Ciacchella',
      imagePath: 'assets/images/books/book1.png',
      pdfPath: 'assets/pdf/book1.pdf'),
  Book(
      title: 'A Princess of Mars',
      author: 'Edgar Rice Burroughs',
      imagePath: 'assets/images/books/book2.png',
      pdfPath: 'assets/pdf/book2.pdf'),
  Book(
      title: 'Around the World in Eighty Days',
      author: 'Jules Verne',
      imagePath: 'assets/images/books/book3.png',
      pdfPath: 'assets/pdf/book3.pdf'),
  Book(
      title: 'Dead & Buried (A Partners in Crime Supernatural Mystery)',
      author: 'T.K. Eldridge',
      imagePath: 'assets/images/books/book4.png',
      pdfPath: 'assets/pdf/book4.pdf'),
  Book(
      title: '20000 Lieues sous les mers',
      author: 'Jules Verne',
      imagePath: 'assets/images/books/book5.png',
      pdfPath: 'assets/pdf/book5.pdf'),
];

final List<Zone> getZones = [
  Zone(
    name: 'Zone 1',
    latitude: 37.7749,
    longitude: -122.4194,
    radius: 2000.0, // 2000 meters
    type: 1,
  ),
  Zone(
    name: 'Zone 2',
    latitude: 34.0522,
    longitude: -118.2437,
    radius: 2000.0,
    type: 2,
  ),
  Zone(
    name: 'Zone 3',
    latitude: 40.7128,
    longitude: -74.0060,
    radius: 2000.0,
    type: 3,
  ),
  Zone(
    name: 'Zone 4',
    latitude: 41.8781,
    longitude: -87.6298,
    radius: 2000.0,
    type: 1,
  ),
  Zone(
    name: 'Zone 5',
    latitude: 51.5074,
    longitude: -0.1278,
    radius: 2000.0,
    type: 2,
  ),
  Zone(
    name: 'Zone 6',
    latitude: 48.8566,
    longitude: 2.3522,
    radius: 2000.0,
    type: 3,
  ),
  Zone(
    name: 'Zone 7',
    latitude: 35.6895,
    longitude: 139.6917,
    radius: 2000.0,
    type: 1,
  ),
  Zone(
    name: 'Zone 8',
    latitude: -33.8688,
    longitude: 151.2093,
    radius: 2000.0,
    type: 2,
  ),
  Zone(
    name: 'Zone 9',
    latitude: -22.9068,
    longitude: -43.1729,
    radius: 2000.0,
    type: 3,
  ),
  Zone(
    name: 'Zone 10',
    latitude: 55.7558,
    longitude: 37.6176,
    radius: 2000.0,
    type: 1,
  ),
];

List<Place> getPlaces = [
  Place(
    name: "Example City 1",
    latitude: 41.8781,
    longitude: -87.6298,
    phone: "+1 (123) 456-7890",
    water: 30,
    availability: "Drink, Food, Clothes",
    people: 5000,
    type: 1,
    access: [1, 2, 3],
  ),
  Place(
    name: "Example Village 1",
    latitude: 36.7783,
    longitude: -119.4179,
    phone: "+1 (987) 654-3210",
    water: 20,
    availability: "Drink, Food",
    people: 100,
    type: 2,
    access: [1, 2],
  ),
  Place(
    name: "Example District 1",
    latitude: 51.5074,
    longitude: -0.1278,
    phone: "+44 20 7123 4567",
    water: 40,
    availability: "Drink, Clothes",
    people: 20000,
    type: 1,
    access: [1, 3],
  ),
  Place(
    name: "Example Ward 1",
    latitude: 34.0522,
    longitude: -118.2437,
    phone: "+1 (555) 789-1234",
    water: 25,
    availability: "Food, Clothes",
    people: 3000,
    type: 2,
    access: [2, 3],
  ),
  Place(
    name: "Example City 2",
    latitude: 40.7128,
    longitude: -74.0060,
    phone: "+1 (333) 444-5555",
    water: 35,
    availability: "Drink, Food",
    people: 8000,
    type: 1,
    access: [1, 2],
  ),
  Place(
    name: "Example Village 2",
    latitude: 45.4215,
    longitude: -75.6919,
    phone: "+1 (111) 222-3333",
    water: 15,
    availability: "Food, Clothes",
    people: 150,
    type: 2,
    access: [2, 3],
  ),
  Place(
    name: "Example District 2",
    latitude: 52.5200,
    longitude: 13.4050,
    phone: "+49 30 12345678",
    water: 50,
    availability: "Drink, Food, Clothes",
    people: 25000,
    type: 1,
    access: [1, 2, 3],
  ),
  Place(
    name: "Example Ward 2",
    latitude: 37.7749,
    longitude: -122.4194,
    phone: "+1 (777) 888-9999",
    water: 18,
    availability: "Food",
    people: 4000,
    type: 2,
    access: [1],
  ),
  Place(
    name: "Example City 3",
    latitude: 51.1657,
    longitude: 10.4515,
    phone: "+49 170 1234567",
    water: 28,
    availability: "Drink, Food, Clothes",
    people: 7000,
    type: 1,
    access: [1, 2, 3],
  ),
  Place(
    name: "Example Village 3",
    latitude: 34.0522,
    longitude: -118.2437,
    phone: "+1 (999) 111-2222",
    water: 22,
    availability: "Drink, Food",
    people: 250,
    type: 2,
    access: [1, 3],
  ),
];

class Book {
  final String title;
  final String author;
  final String imagePath;
  final String pdfPath;

  Book(
      {required this.title,
      required this.author,
      required this.imagePath,
      required this.pdfPath});
}

class Zone {
  final String name;
  final double latitude;
  final double longitude;
  final double radius; // 2000 meters
  final int type; // only 1, 2, or 3

  Zone(
      {required this.name,
      required this.latitude,
      required this.longitude,
      required this.radius,
      required this.type});
}

class Place {
  final String name; // name of district / village / city / ward
  final double latitude;
  final double longitude;
  final String phone;
  final int water; // example: 30 Liters
  final String availability; // example: Drink, Food and, Clothes
  final int people;
  final int type; // only 1 or 2
  final List<int> access; // only 1, 2, and 3 not duplicate {1, 2, 3}

  Place(
      {required this.name,
      required this.latitude,
      required this.longitude,
      required this.phone,
      required this.water,
      required this.availability,
      required this.people,
      required this.type,
      required this.access});
}

// Future<bool> _handleLocationPermission(BuildContext context) async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('Location services are disabled. Please enable the services')));
//     return false;
//   }
//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Location permissions are denied')));
//       return false;
//     }
//   }
//   if (permission == LocationPermission.deniedForever) {
//     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//         content: Text('Location permissions are permanently denied, we cannot request permissions.')));
//     return false;
//   }
//   return true;
// }

Position? currentPosition;
Future<String> getLocationData() async {
  try {
    // Get current position using Geolocator
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Get address information using Geocoding
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    currentPosition = position;

    // Construct the location message
    return "Latitude: ${position.latitude}, Longitude: ${position.longitude}\n" +
        "Address: ${placemarks[0].name}, ${placemarks[0].subLocality}, ${placemarks[0].locality}, ${placemarks[0].administrativeArea}, ${placemarks[0].country}";
  } catch (e) {
    return "Error fetching location data: $e";
  }
}
