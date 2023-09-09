import 'package:app_mitigasi_bencana/helper.dart';
import 'package:app_mitigasi_bencana/navigasi.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Lapor extends StatefulWidget {
  @override
  _LaporState createState() => _LaporState();
}

class _LaporState extends State<Lapor> {
  Place? selectedPlace;

  Future<void> _openWhatsAppChat() async {
    String message =
        Uri.encodeComponent("Hello, I'm reaching out from my Flutter app!");
    final Uri phoneNumber = Uri.parse('tel:+123456789');
    final Uri whatsappUrl = Uri.parse('https://wa.me/62895421891378');

    await launchUrl(whatsappUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.975),
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
              "Lapor",
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
      body: ListView.builder(
        itemCount: getPlaces.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Container(
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors
                    .white, // Change this color to your desired background color
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(8), // Adjust margin as needed
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        color: Colors
                            .white, // Add a background color for the image frame
                        child: Image.asset(
                          'assets/images/lapor.png',
                          fit: BoxFit.cover,
                          height: 200.0, // Adjust the height as needed
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Badan Penanggulangan',
                          style: TextStyle(
                              color: Color(0xFF9D0000),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Bencana Daerah Jogja',
                          style: TextStyle(
                              color: Color(0xFF9D0000),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Call Center: ',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '+62 811-2628-911',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () async {
                            _openWhatsAppChat();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF930000)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the radius as needed
                              ),
                            ),
                            minimumSize: MaterialStateProperty.all(Size(
                                double.infinity, 38.0)), // Full width button
                          ),
                          child: Text(
                            "Hubungi",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            final place = getPlaces[index - 1];
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      color:
                          Colors.white, // Background color for the rounded edge
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Shadow position
                        ),
                      ]),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Container(
                          width: double.infinity, // Full width for the item
                          decoration: BoxDecoration(
                            color: Colors
                                .white, // White background color for the item
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), // Shadow color
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3), // Shadow position
                              ),
                            ],
                          ),
                          child: MaterialButton(
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${place.name}',
                                    style: TextStyle(
                                        color: Color(0xFF9D0000),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Stack(
                                    children: [
                                      Visibility(
                                        visible: selectedPlace == place,
                                        child: Image.asset(
                                          'assets/images/arrow_down.png',
                                          width: 20,
                                        ),
                                      ),
                                      Visibility(
                                        visible: selectedPlace != place,
                                        child: Image.asset(
                                          'assets/images/arrow_right.png',
                                          width: 20,
                                        ),
                                      )
                                    ],
                                  )
                                ]),
                            onPressed: () {
                              setState(() {
                                if (selectedPlace == place) {
                                  selectedPlace = null;
                                } else
                                  selectedPlace = place;
                              });
                            },
                          ),
                        ),
                      ),
                      if (selectedPlace == place)
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0),
                          ),
                          child: Container(
                            width: double
                                .infinity, // Full width for the description
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Colors.black, // Shadow color
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3), // Shadow position
                              ),
                            ]),
                            child: Column(
                              children: [
                                Container(
                                  height: 8.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12.0),
                                        bottomRight: Radius.circular(12.0),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey
                                              .withOpacity(0.5), // Shadow color
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset:
                                              Offset(0, 3), // Shadow position
                                        ),
                                      ]),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    child: Container(
                                      height: 290,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      padding: EdgeInsets.all(8),
                                      child: selectedPlace != null
                                          ? PlaceCard(
                                              place: selectedPlace!,
                                            )
                                          : Text('No location selected'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final Place place;

  PlaceCard({required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(right: 8, left: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Image.asset('assets/images/phone.png'),
                      SizedBox(width: 8.0),
                      Text(
                        place.phone,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ]),
                    SizedBox(height: 8.0),
                    Text(
                      "Ketersediaan",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6.0),
                    Row(children: [
                      SizedBox(width: 3.0),
                      Image.asset(
                        'assets/images/water.png',
                        width: 14,
                      ),
                      SizedBox(width: 11.0),
                      Text(
                        '${place.water} Liter',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ]),
                    SizedBox(height: 4.0),
                    Row(children: [
                      Image.asset(
                        'assets/images/food.png',
                        width: 20,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        place.availability,
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ]),
                    SizedBox(height: 4.0),
                    Row(children: [
                      Image.asset(
                        'assets/images/clothes.png',
                        width: 20,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        '${place.people} Orang',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ]),
                    SizedBox(height: 8.0),
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
                    SizedBox(height: 12),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  startPlace = place;
                  Navigator.push(context, MaterialPageRoute(builder: (i) {
                    return Navigasi();
                  }));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF930000)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Adjust the radius as needed
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                      Size(double.infinity, 38.0)), // Full width button
                ),
                child: Text(
                  "Lokasi",
                  style: TextStyle(fontSize: 16.0),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
