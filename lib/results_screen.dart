import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummeryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'questions_index': i,
          'questions': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
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
          getTitleText(),
          getAnswerText(),
          getStartQuizButton(),
        ],
      ),
    );
  }

  Widget getTitleText() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Text(
        'You answered X out of Y questions Correctly!',
        style: GoogleFonts.lato(
          // fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget getAnswerText() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Text(
        'List of answers and questions',
        style: GoogleFonts.lato(
          // fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget getStartQuizButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: InkWell(
        onTap: () {},
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
                'Restart Quiz',
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
