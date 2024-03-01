import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Center(
                      child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Text(
                            ((data["question_index"] as int) + 1).toString(),
                          ))),
                  Expanded(
                    child: Column(
                      children: [
                        Text(data['questions'] as String),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['user_answer'] as String),
                        Text(data['correct_answer'] as String),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
