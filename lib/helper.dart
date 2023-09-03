import 'dart:io';

import 'package:app_mitigasi_bencana/books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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

final List<Place> getPlaces = [
  Place(
    name: 'Place A',
    latitude: 37.7749,
    longitude: -122.4194,
    phone: '+1 123-456-7890',
    water: 30,
    availability: 'Drink, Food, Clothes',
    people: 50,
    type: 1,
  ),
  Place(
    name: 'Place B',
    latitude: 34.0522,
    longitude: -118.2437,
    phone: '+1 987-654-3210',
    water: 25,
    availability: 'Food, Clothes',
    people: 40,
    type: 2,
  ),
  Place(
    name: 'Place C',
    latitude: 40.7128,
    longitude: -74.0060,
    phone: '+1 555-123-4567',
    water: 40,
    availability: 'Drink, Food',
    people: 60,
    type: 1,
  ),
  Place(
    name: 'Place D',
    latitude: 41.8781,
    longitude: -87.6298,
    phone: '+1 333-444-5555',
    water: 20,
    availability: 'Drink, Food, Clothes',
    people: 30,
    type: 2,
  ),
  Place(
    name: 'Place E',
    latitude: 51.5074,
    longitude: -0.1278,
    phone: '+44 20 1234 5678',
    water: 35,
    availability: 'Drink',
    people: 45,
    type: 1,
  ),
  Place(
    name: 'Place F',
    latitude: 48.8566,
    longitude: 2.3522,
    phone: '+33 1 2345 6789',
    water: 15,
    availability: 'Food, Clothes',
    people: 25,
    type: 2,
  ),
  Place(
    name: 'Place G',
    latitude: 35.6895,
    longitude: 139.6917,
    phone: '+81 3-1234-5678',
    water: 50,
    availability: 'Drink, Food',
    people: 70,
    type: 1,
  ),
  Place(
    name: 'Place H',
    latitude: -33.8688,
    longitude: 151.2093,
    phone: '+61 2 9876 5432',
    water: 30,
    availability: 'Drink, Clothes',
    people: 40,
    type: 2,
  ),
  Place(
    name: 'Place I',
    latitude: -22.9068,
    longitude: -43.1729,
    phone: '+55 21 98765-4321',
    water: 25,
    availability: 'Food',
    people: 35,
    type: 1,
  ),
  Place(
    name: 'Place J',
    latitude: 55.7558,
    longitude: 37.6176,
    phone: '+7 495 123-45-67',
    water: 40,
    availability: 'Drink, Food, Clothes',
    people: 55,
    type: 2,
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

  Place(
      {required this.name,
      required this.latitude,
      required this.longitude,
      required this.phone,
      required this.water,
      required this.availability,
      required this.people,
      required this.type});
}

Future<bool> _handleLocationPermission(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;
  
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Location services are disabled. Please enable the services')));
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {   
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')));
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Location permissions are permanently denied, we cannot request permissions.')));
    return false;
  }
  return true;
}

Position? currentPosition;