import 'package:app_mitigasi_bencana/helper.dart';
import 'package:app_mitigasi_bencana/home.dart';
import 'package:app_mitigasi_bencana/kerjakan_kuis.dart';
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
                Navigator.popUntil(context, (route) => route.isFirst);
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
            ListView(
              children: [Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Text(
                  "${quiz.title}",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Image.asset(
                  'assets/images/checklist.png',
                  width: 220,
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Telah Selesai",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dengan Skor",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 90, // Set the width as needed
                        height: 32.0, // Set the height as needed
                        decoration: BoxDecoration(
                          color: Color(0xFF930000), // Background color
                          borderRadius: BorderRadius.circular(
                              20.0), // Adjust the radius as needed
                        ),
                        child: Container(
                          child: Text(
                            '${answers.asMap().entries.where((st) => st.value == quiz.questions[st.key].correct).length}/${quiz.questions.length}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow
                                .ellipsis, // Show ellipsis for overflow
                          ),
                        ),
                      ),
                    ]),
              ],
            )]),
            Container(
              height: 160,
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
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
                      "Daftar Kuis",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KerjakanKuis(quiz: quiz)));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.yellow.shade700),
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
                      "Mulai Ulang",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      int index = getQuizs
                          .asMap()
                          .entries
                          .firstWhere((element) => element.value == quiz)
                          .key;
                      if (index + 1 < getQuizs.length) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KerjakanKuis(quiz: getQuizs[index + 1])));
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
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
                      "Kuis Berikutnya",
                      style: TextStyle(fontSize: 16.0),
                    ),
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
