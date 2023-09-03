import 'package:app_mitigasi_bencana/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
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