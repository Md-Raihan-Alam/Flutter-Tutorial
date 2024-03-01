import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizStart extends StatelessWidget {
  const QuizStart(this.switchScreen, {super.key});
  final void Function() switchScreen;
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Opacity( // --> not recommended
        //   opacity: 0.5,
        //   child: Image.asset(
        //     "assets/images/quiz-logo.png",
        //     width: 200,
        //   ),
        // ),
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 200,
          color: const Color.fromARGB(
              155, 255, 255, 255), // now opacity and better way
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          "Learn Flutter the fun way!",
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 28.0,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        OutlinedButton.icon(
          onPressed: switchScreen,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text("Start Quiz"),
        )
      ],
    );
  }
}
