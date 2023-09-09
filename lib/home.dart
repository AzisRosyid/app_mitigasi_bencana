import 'package:app_mitigasi_bencana/books.dart';
import 'package:app_mitigasi_bencana/helper.dart';
import 'package:app_mitigasi_bencana/lapor.dart';
import 'package:app_mitigasi_bencana/navigasi.dart';
import 'package:app_mitigasi_bencana/kuis.dart';
import 'package:app_mitigasi_bencana/shelter.dart';
import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height / 2);
    path.cubicTo(size.width / 2.6, (size.height / 5), size.width / 1.4,
        size.height * 1.4, size.width * 1.02, size.height * .75);
    path.lineTo(size.width, size.height / 1.5);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  // Widget _listItemH(
  //   @required BuildContext context,
  //   @required Color color,
  //   @required String title,
  //   @required String subtitle,
  // ) {
  //   return MaterialButton(
  //     onPressed: () {
  //       Navigator.push(context, MaterialPageRoute(builder: (context) {
  //         return OrderTrackingPage();
  //       }));
  //     },
  //     padding: EdgeInsets.zero,
  //     child: Container(
  //       margin: EdgeInsets.symmetric(horizontal: 10.0),
  //       height: 120,
  //       width: 240,
  //       decoration: BoxDecoration(
  //         color: color,
  //         borderRadius: BorderRadius.circular(15.0),
  //         border:
  //             Border.all(color: Colors.blueAccent, width: 1.0), // Add border
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.grey.withOpacity(0.5), // Shadow color
  //             spreadRadius: 2,
  //             blurRadius: 5,
  //             offset: Offset(0, 3), // Shadow position
  //           ),
  //         ],
  //       ),
  //       child: Container(
  //         padding: EdgeInsets.only(left: 20),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Text(
  //               title,
  //               style: TextStyle(fontSize: 22, color: Colors.white),
  //             ),
  //             SizedBox(
  //               height: 5,
  //             ),
  //             Text(
  //               subtitle,
  //               style: TextStyle(fontSize: 19, color: Colors.white70),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _opsiMenuItem(@required BuildContext context, @required int page,
      @required String image, @required String name) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border:
              Border.all(color: Color(0xFF930000).withOpacity(.8), width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
            BoxShadow(
              color: Colors.white,
            ),
          ],
        ),
        child: MaterialButton(
          onPressed: () {
            switch (page) {
              case 1:
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Education();
                }));
              case 2:
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Lapor();
                }));
              case 3:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Shelter()));
              case 5:
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Kuis()));
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.contain)),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            margin:
                EdgeInsets.only(top: 10.0), // Adjust the top margin as needed
            child: Image.asset(
              'assets/images/logo.jpg', // Replace with your image path
              fit: BoxFit
                  .contain, // Make the image fit within the phone's width without cropping
            ),
          ),
          ClipPath(
              child: Container(
                  color: Colors.white,
                  height: 160.0,
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Color(0xFFA30000),
                            Color(0xFFC30000),
                          ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)))),
              clipper: WaveClipper()),
          // Text Overlaid on Background
          Positioned(
              top: 120,
              left: 20,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StrokeText(
                      text: 'Edu MIT',
                      textStyle: TextStyle(
                        fontSize: 50,
                        color: Color(0xFFC30000),
                        fontFamily: 'Knewave',
                      ),
                      strokeWidth: 5,
                      strokeColor: Colors.white,
                    ),
                    Padding(padding: EdgeInsets.all(4)),
                    StrokeText(
                      text: 'Aplikasi Edukasi dan Mitigasi Bencana',
                      textStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      strokeWidth: 4,
                      strokeColor: Colors.white,
                    )
                  ])),
          Container(
            margin: EdgeInsets.only(top: 260),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // Body
                child: Container(
                  height: 750,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Peta",
                          style: TextStyle(
                              fontSize: 23,
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF930000),
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 5, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 0,
                              ),
                              child: Container(
                                  height: 230,
                                  width: double.infinity,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/map.png"),
                                            fit: BoxFit.cover),
                                        border: Border.all(
                                            color: Color(0xFF930000)
                                                .withOpacity(.8),
                                            width: 2),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 3,
                                            offset: Offset(0, 2),
                                          ),
                                          BoxShadow(
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                      child: MaterialButton(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            startPlace = null;
                                            return Navigasi();
                                          }));
                                        },
                                      ))),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // Menu
                              "Menu",
                              style: TextStyle(
                                  fontSize: 23,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFF930000),
                                  color: Colors.black,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              // Menu Item
                              height: 390,
                              child: GridView.count(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 8,
                                childAspectRatio: 1.30,
                                children: [
                                  _opsiMenuItem(context, 1,
                                      "assets/images/book.png", "Edukasi"),
                                  _opsiMenuItem(context, 2,
                                      "assets/images/report.png", "Lapor"),
                                  _opsiMenuItem(
                                      context,
                                      3,
                                      "assets/images/shelter.png",
                                      "Info Shelter"),
                                  _opsiMenuItem(context, 4,
                                      "assets/images/donation.png", "Donasi"),
                                  _opsiMenuItem(context, 5,
                                      "assets/images/quiz.png", "Kuis")
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
