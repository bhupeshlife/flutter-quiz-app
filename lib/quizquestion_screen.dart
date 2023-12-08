import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuizQuestions extends StatefulWidget {
  const QuizQuestions({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuizQuestions> createState() => _QuizQuestionsState();
}

class _QuizQuestionsState extends State<QuizQuestions> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectAnswer) {
    widget.onSelectAnswer(selectAnswer);
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      appBar: getAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                bottom: 20,
                left: 22,
              ),
              child: Text(
                currentQuestion.text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: [
                ...currentQuestion.getSuffledAnswers().map(
                  (answer) {
                    return AnswerButton(
                        answerText: answer,
                        onTab: () {
                          answerQuestion(answer);
                        });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
    );
  }

  AppBar getAppBar() {
    return AppBar(
      elevation: 0,
      leading: const BackButton(),
      backgroundColor: Colors.deepPurpleAccent,
    );
  }

  // Widget getBody() {
  //   return SafeArea(
  //     child: Column(
  //       children: [getQuestionText(), getAnswerButton()],
  //     ),
  //   );
  // }

  // Widget getQuestionText() {
  //   return Padding(
  //     padding: const EdgeInsets.only(
  //       top: 50,
  //       bottom: 20,
  //       left: 22,
  //     ),
  //     child: Text(
  //       currentQuestion.text,
  //       style: const TextStyle(
  //         fontWeight: FontWeight.bold,
  //         fontSize: 20,
  //         color: Colors.white,
  //       ),
  //     ),
  //   );
  // }

  // Widget getAnswerButton() {
  //   return Column(
  //     children: [
  //       ...currentQuestion.getSuffledAnswers().map((answer) {
  //         return AnswerButton(answerText: answer, onTab: answerQuestion);
  //       }),
  //     ],
  //   );
  // }
}
