import 'package:app_mitigasi_bencana/helper.dart';
import 'package:app_mitigasi_bencana/kuis.dart';
import 'package:flutter/material.dart';

class SelesaiKuis extends StatelessWidget {
  final Quiz quiz;
  final List<int?> answers;

  SelesaiKuis({required this.quiz, required this.answers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            elevation: 0, // Remove the shadow
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(top: 12, bottom: 12, left: 25),
                child: Image.asset(
                  'assets/images/home.png', // Replace with your custom image asset path
                  width: 20,
                ),
              ),
            ),
            title: Text(
              "Hasil Kuis",
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
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: Center()
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Center()
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    // Content Container
                    height: 150,
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: ListView(
                      children: [
                        
                      ],
                    )),
              ],
            ),
            Container(
              height: 250,
              alignment: Alignment.bottomCenter,
              child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: Center()
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Center()
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
