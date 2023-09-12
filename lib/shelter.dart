import 'package:app_mitigasi_bencana/data/place.dart';
import 'package:app_mitigasi_bencana/helper.dart';
import 'package:app_mitigasi_bencana/navigasi.dart';
import 'package:flutter/material.dart';

class Shelter extends StatefulWidget {
  @override
  _ShelterState createState() => _ShelterState();
}

class _ShelterState extends State<Shelter> {
  Place? selectedPlace;
  List<Place> shelters = getPlaces.where((st) => st.type == 1).toList();
  bool _isAlertDialogVisible = false;

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
                colors: [
                  Color(0xFF930000),
                  Color(0xFFC30000)
                ], // Gradient colors
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
                "Info Shelter",
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
        body: Stack(children: [
          ListView.builder(
            itemCount: shelters.length,
            itemBuilder: (BuildContext context, int index) {
              final place = shelters[index];
              return Container(
                margin: EdgeInsets.only(right: 16, left: 16, bottom: 8, top: 8),
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
                          color: Colors.grey.shade400,
                          width: double.infinity,
                          height:
                              200, // Add a background color for the image frame
                          child: Image.asset(
                            'assets/images/shelter.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 190, // Set the maximum width
                                  child: Text(
                                    '${place.name}',
                                    style: TextStyle(
                                      color: Color(0xFF9D0000),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow
                                        .ellipsis, // Show ellipsis for overflow
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              selectedPlace = place;
                              _showAlertDialog(); // Call the _showAlertDialog method
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
                                  Size(100, 35.0)), // Full width button
                            ),
                            child: Text(
                              "Detail",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          if (_isAlertDialogVisible) _buildAlertDialog(),
        ]));
  }

  // Function to show the AlertDialog
  void _showAlertDialog() {
    setState(() {
      _isAlertDialogVisible = true;
    });
  }

  // Function to hide the AlertDialog
  void _hideAlertDialog() {
    setState(() {
      _isAlertDialogVisible = false;
    });
  }

  Widget _buildAlertDialog() {
    return Stack(
      children: [
        // Modal barrier for the darkened background
        ModalBarrier(
          color: Colors.black.withOpacity(0.5), // Adjust the opacity as needed
          dismissible: false,
        ),
        // Centered GestureDetector wrapped AlertDialog
        Center(
          child: Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .08,
                bottom: MediaQuery.of(context).size.height * .19),
            child: GestureDetector(
              onTap: () {
                _hideAlertDialog(); // Hide the AlertDialog when tapped
              },
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                content: ListView(
                  shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Informasi',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Divider(
                          color: Color(0xFF930000), // Color of the line
                          thickness: 1.5, // Adjust the thickness as needed
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8.0),
                          Row(children: [
                            Image.asset('assets/images/phone.png'),
                            SizedBox(width: 8.0),
                            Text(
                              selectedPlace!.phone,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
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
                              '${selectedPlace!.water} Liter',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
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
                              selectedPlace!.availability,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
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
                              '${selectedPlace!.people} Orang',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
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
                                visible: selectedPlace!.access.contains(1),
                                child: Image.asset(
                                  'assets/images/motor.png',
                                  width: 50,
                                ),
                              ),
                              Visibility(
                                visible: selectedPlace!.access.contains(1),
                                child: SizedBox(width: 8.0),
                              ),
                              Visibility(
                                visible: selectedPlace!.access.contains(2),
                                child: Image.asset(
                                  'assets/images/car.png',
                                  width: 40,
                                ),
                              ),
                              Visibility(
                                visible: selectedPlace!.access.contains(2),
                                child: SizedBox(width: 8.0),
                              ),
                              Visibility(
                                visible: selectedPlace!.access.contains(3),
                                child: Image.asset(
                                  'assets/images/truck.png',
                                  width: 40,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              startPlace = selectedPlace!;
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (i) {
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
                                      8.0), // Adjust the radius as needed
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all(Size(
                                  double.infinity, 38.0)), // Full width button
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
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
