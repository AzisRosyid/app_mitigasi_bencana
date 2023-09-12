class Zone {
  // Data Zona
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

final List<Zone> getZones = [
  Zone(
      name: 'Merapi 2',
      latitude: -7.54183620280509,
      longitude: 110.437016897829,
      radius: 20,
      type: 2),
  Zone(
      name: 'Merapi 1',
      latitude: -7.54183620280509,
      longitude: 110.437016897829,
      radius: 8,
      type: 3),
];

// final List<Zone> getZones = [
//   Zone(
//     name: 'Zone 1',
//     latitude: 37.7749,
//     longitude: -122.4194,
//     radius: 2000.0, // 2000 meters
//     type: 1,
//   ),
//   Zone(
//     name: 'Zone 2',
//     latitude: 34.0522,
//     longitude: -118.2437,
//     radius: 2000.0,
//     type: 2,
//   ),
//   Zone(
//     name: 'Zone 3',
//     latitude: 40.7128,
//     longitude: -74.0060,
//     radius: 2000.0,
//     type: 3,
//   ),
//   Zone(
//     name: 'Zone 4',
//     latitude: 41.8781,
//     longitude: -87.6298,
//     radius: 2000.0,
//     type: 1,
//   ),
//   Zone(
//     name: 'Zone 5',
//     latitude: 51.5074,
//     longitude: -0.1278,
//     radius: 2000.0,
//     type: 2,
//   ),
//   Zone(
//     name: 'Zone 6',
//     latitude: 48.8566,
//     longitude: 2.3522,
//     radius: 2000.0,
//     type: 3,
//   ),
//   Zone(
//     name: 'Zone 7',
//     latitude: 35.6895,
//     longitude: 139.6917,
//     radius: 2000.0,
//     type: 1,
//   ),
//   Zone(
//     name: 'Zone 8',
//     latitude: -33.8688,
//     longitude: 151.2093,
//     radius: 2000.0,
//     type: 2,
//   ),
//   Zone(
//     name: 'Zone 9',
//     latitude: -22.9068,
//     longitude: -43.1729,
//     radius: 2000.0,
//     type: 3,
//   ),
//   Zone(
//     name: 'Zone 10',
//     latitude: 55.7558,
//     longitude: 37.6176,
//     radius: 2000.0,
//     type: 1,
//   ),
// ];
