import 'package:app_mitigasi_bencana/books.dart';
import 'package:app_mitigasi_bencana/navigasi.dart';
import 'package:app_mitigasi_bencana/page1.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _listItemH(
    @required BuildContext context,
    @required Color color,
    @required String title,
    @required String subtitle,
  ) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Page1();
        }));
      },
      padding: EdgeInsets.zero,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        height: 120,
        width: 240,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.0),
          border:
              Border.all(color: Colors.blueAccent, width: 1.0), // Add border
          boxShadow: [
            // BoxShadow(
            //   color: Colors.grey.withOpacity(0.5), // Shadow color
            //   spreadRadius: 2,
            //   blurRadius: 5,
            //   offset: Offset(0, 3), // Shadow position
            // ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 19, color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _opsiMenuItem(@required BuildContext context, @required int page,
      @required String image, @required String name) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black.withOpacity(.8), width: 1),
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
              case 0:
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Navigasi();
                }));
              case 1:
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Education();
                }));
              case 2:
                _openWhatsAppChat();
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(image))),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 17, color: Colors.black87),
              ),
            ],
          ),
        ));
  }

  void _openWhatsAppChat() async {
   // String message = Uri.encodeComponent("Hello, I'm reaching out from my Flutter app!");
    final Uri phoneNumber = Uri.parse('tel:+123456789');
    final Uri whatsappUrl = Uri.parse('https://wa.me/0895421891378');

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            "Mitigasi Bencana",
            style: TextStyle(fontSize: 23),
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Container(
            height: 800,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ListView(
              padding: EdgeInsets.only(left: 15, right: 15, top: 30),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Histori Lokasi",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8, right: 8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 12),
                      child: Row(
                        children: [
                          _listItemH(context, Theme.of(context).primaryColor,
                              "Hello World!", "Hello"),
                          _listItemH(context, Theme.of(context).primaryColor,
                              "Hello World!", "World"),
                          _listItemH(context, Theme.of(context).primaryColor,
                              "Hello World!", "HW!")
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Opsi Menu',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: Container(
                          height: 300,
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1.30,
                            children: [
                              _opsiMenuItem(context, 0, "assets/images/map.png",
                                  "Peta Navigasi"),
                              _opsiMenuItem(context, 1,
                                  "assets/images/book.png", "Edukasi"),
                              _opsiMenuItem(context, 2,
                                  "assets/images/report.png", "Pelaporan TP")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
