import 'package:flutter/material.dart';

class Solution extends StatefulWidget {
  const Solution({super.key});

  @override
  State<Solution> createState() => _SolutionState();
}

class _SolutionState extends State<Solution> {
  String text = "Hello, Flutter!";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(text),
              ElevatedButton(
                  onPressed: () {
                    setState(
                      () => text = "You pressed the button!",
                    );
                  },
                  child: Text("Click Me")),
            ],
          ),
        ),
      ),
    );
  }
}
