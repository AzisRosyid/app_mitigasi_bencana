import 'dart:io';

import 'package:app_mitigasi_bencana/helper.dart';
import 'package:app_mitigasi_bencana/splash.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    Future<void> _getLocation() async {
      var status = await Permission.location.request();

      if (status.isGranted) {
        // Get the location and address
        var locationData = await getLocationData();
      } else {
        exit(10);
      }
    }

    _getLocation();

    return MaterialApp(
      title: 'Convex Buttom Bar',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
