import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReadBook extends StatelessWidget {
  final String title;
  final String pdfPath;

  ReadBook({required this.title, required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.975),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60), // Set the preferred height of the AppBar
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
              title,
              style: TextStyle(
                color: Colors.white, // Set text color to white
                fontSize: 20, // Adjust font size as needed
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold
              ),
            ),
            centerTitle: true, // Center the title horizontally
          ),
        ),
      ),
      body: Center(
        child: SfPdfViewer.asset(pdfPath),
      ),
    );
  }
}
