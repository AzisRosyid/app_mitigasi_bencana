import 'package:app_mitigasi_bencana/helper.dart';
import 'package:app_mitigasi_bencana/navigasi.dart';
import 'package:flutter/material.dart';

class DetailDonasi extends StatelessWidget {
  final Place place;

  DetailDonasi({required this.place});

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
              "Detail Donasi",
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
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Text(
                  "${place.name}",
                  style: TextStyle(
                      color: Color(0xFF930000),
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  margin: EdgeInsets.all(8), // Adjust margin as needed
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          color: Colors
                              .white, // Add a background color for the image frame
                          child: Image.asset(
                            'assets/images/donate_default.png',
                            fit: BoxFit.cover,
                            height: 210.0, // Adjust the height as needed
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFF930000), // Border color
                              width: 2.2, // Border width
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  'Lokasi Shelter',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 115,
                  child: Divider(
                    color: Color(0xFF930000), // Color of the line
                    thickness: 1.5,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Kebutuhan Shelter",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 6.0),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/water.png',
                                width: 16,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Image.asset(
                                'assets/images/food.png',
                                width: 24,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Image.asset(
                                'assets/images/clothes.png',
                                width: 24,
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kontak Donasi",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 6.0),
                          Row(children: [
                          Image.asset('assets/images/phone.png'),
                          SizedBox(width: 8.0),
                          Text(
                            place.phone,
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                        ]),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Donasi Langsung',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 140,
                  child: Divider(
                    color: Color(0xFF930000), // Color of the line
                    thickness: 1.5,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                          onPressed: () {
                                              startPlace = place;
                  Navigator.push(context, MaterialPageRoute(builder: (i) {
                    return Navigasi();
                  }));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF930000)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Adjust the radius as needed
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all(
                                Size(120, 35.0)), // Full width button
                          ),
                          child: Text(
                            "Lokasi",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        SizedBox(
                  height: 30,
                ),
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
