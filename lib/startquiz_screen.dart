import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartQuizScreen extends StatelessWidget {
  const StartQuizScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      backgroundColor: Colors.deepPurpleAccent,
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Column(
        children: [
          getBackgroundImage(),
          getTitleText(),
          getStartQuizButton(),
        ],
      ),
    );
  }

  Widget getBackgroundImage() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Image.asset(
        'assets/images/quizlogo.png',
        // width: 300,
        color: Colors.white54,
      ),
    );
  }

  Widget getTitleText() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Text(
        'Learn Flutter the Fun way!',
        style: GoogleFonts.lato(
          // fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
        // TextStyle(
        //   fontWeight: FontWeight.bold,
        //   fontSize: 20,
        //   color: Colors.white,
        // ),
      ),
    );
  }

  Widget getStartQuizButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: InkWell(
        onTap: () {
          startQuiz();
        },
        child: Container(
          height: 50,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 2, color: Colors.white),
            color: Colors.deepPurpleAccent,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Start Quiz',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 2,
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
