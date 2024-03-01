import 'package:flutter/material.dart';
import 'package:quiz_app/data/all_questions.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/quiz_start.dart';
import 'package:quiz_app/results_screen.dart';

const alignmentLeft = Alignment.topLeft;
const alignmentRight = Alignment.bottomRight;

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  // @override
  // void initState() {
  //   activeScreen = QuizStart(switchScreen);
  //   super.initState();
  // }
  var activeScreen = "start-screen";
  List<String> selectedAnswers = [];
  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = QuizStart(switchScreen);
    if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == "result-screen") {
      screenWidget = ResultScreen(choseAnswers: selectedAnswers);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 26, 2, 80),
                Color.fromARGB(255, 45, 7, 98),
              ],
              begin: alignmentLeft,
              end: alignmentRight,
            ),
          ),
          child: Center(
            child: screenWidget,
          ),
        ),
      ),
    );
  }
}
