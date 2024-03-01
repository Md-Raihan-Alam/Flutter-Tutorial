import 'package:flutter/material.dart';
import 'package:quiz_app/data/all_questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choseAnswers});

  final List<String> choseAnswers;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < questions.length; i++) {
      summary.add({
        "question_index": i,
        "questions": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": choseAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data["user_answer"] == data["correct_answer"];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!",
            style: const TextStyle(color: Colors.white, fontSize: 23.0),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(summaryData),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Restart Quiz"),
          ),
        ]),
      ),
    );
  }
}
