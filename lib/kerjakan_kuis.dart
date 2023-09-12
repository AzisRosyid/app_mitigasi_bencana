import 'dart:async';
import 'package:app_mitigasi_bencana/data/quiz.dart';
import 'package:app_mitigasi_bencana/selesai_kuis.dart';
import 'package:flutter/material.dart';

class KerjakanKuis extends StatefulWidget {
  final Quiz quiz;

  const KerjakanKuis({super.key, required this.quiz});

  @override
  State<KerjakanKuis> createState() => _KerjakanKuisState(quiz: quiz);
}

class _KerjakanKuisState extends State<KerjakanKuis> {
  final Quiz quiz;
  int index = 0;
  List<int?> answers = [];
  int? idAnswer = null;

  _KerjakanKuisState({required this.quiz});

  @override
  void initState() {
    for (int i = 0; i < quiz.questions.length; i++) {
      answers.add(null);
    }
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.isActive && timer.tick < 180) {
        updateTimer();
      }
    });
  }

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
              quiz.title,
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
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                child: Text(
                                  '${index + 1}/${quiz.questions.length}',
                                  style: TextStyle(
                                    color: Color(0xFF9D0000),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow
                                      .ellipsis, // Show ellipsis for overflow
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        QuizProgress(
                            progress: (index + 1) / quiz.questions.length),
                      ]),
                ),
                Container(
                  height: 40,
                  margin: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nextQuestion();
                            });
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
                            "Skip",
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Container(
                          width: 100, // Set the width as needed
                          height: 35.0, // Set the height as needed
                          decoration: BoxDecoration(
                            color: Color(0xFF930000), // Background color
                            borderRadius: BorderRadius.circular(
                                20.0), // Adjust the radius as needed
                          ),
                          child: Center(
                            child: Text(
                              "${(timer ~/ 60).toString().padLeft(2, '0')}:${(timer % 60).toString().padLeft(2, '0')}",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                    // Content Container
                    height: 350,
                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: ListView(
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("${index + 1}.",
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(
                                width: 4,
                              ),
                              Container(
                                width: 290,
                                child: Text(
                                  "${quiz.questions[index].contents[0].content}",
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                  softWrap:
                                      true, // Allow text to wrap within its parent container
                                ),
                              )
                            ]),
                      ],
                    )),
              ],
            ),
            Container(
              height: 250,
              alignment: Alignment.bottomCenter,
              child: ListView.builder(
                itemCount: quiz.questions[index].answers.length,
                itemBuilder: (BuildContext context, int i) {
                  final answer = quiz.questions[index].answers[i];
                  return Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 6.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5), // Shadow color
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
                                width:
                                    double.infinity, // Full width for the item
                                decoration: BoxDecoration(
                                  color: idAnswer != i
                                      ? Colors.white
                                      : answers[index] !=
                                              quiz.questions[index].correct
                                          ? Color(0xFF9D0000)
                                          : Colors.green,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${answer}',
                                          style: TextStyle(
                                              color: idAnswer != i
                                                  ? Color(0xFF9D0000)
                                                  : Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Stack(
                                          children: [
                                            Visibility(
                                                visible: idAnswer == i &&
                                                    answers[index] !=
                                                        quiz.questions[index]
                                                            .correct,
                                                child: Image.asset(
                                                  'assets/images/close.png',
                                                  width: 20,
                                                )),
                                            Visibility(
                                                visible: idAnswer == i &&
                                                    answers[index] ==
                                                        quiz.questions[index]
                                                            .correct,
                                                child: Image.asset(
                                                  'assets/images/check.png',
                                                  width: 30,
                                                )),
                                            Visibility(
                                              visible: idAnswer != i,
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
                                      if (idAnswer == null) {
                                        idAnswer = i;
                                        answers[index] = i;
                                        answerQuestion();
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  int timer = 180;

  void updateTimer() {
    setState(() {
      timer--;

      if (timer == 0) {
        nextQuestion();
      }
    });
  }

  void nextQuestion() {
    if (index < quiz.questions.length - 1) {
      index++;
      idAnswer = null;
      timer = 180;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => SelesaiKuis(quiz: quiz, answers: answers)),
      );
    }
  }

  void answerQuestion() {
    timer = 3;
  }
}

class QuizProgress extends StatelessWidget {
  final double progress;

  QuizProgress({required this.progress});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 280, // Set the width as needed
          height: 8, // Set the height as needed
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0), // Round all edges
            color: Colors.grey.shade400, // Background color of the container
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0), // Round the child as well
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors
                  .transparent, // Make the progress bar background transparent
              valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xFF9D0000)), // Color of the progress bar
            ),
          ),
        ),
      ],
    );
  }
}
