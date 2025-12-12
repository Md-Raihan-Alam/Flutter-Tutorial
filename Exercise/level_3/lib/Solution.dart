import 'package:flutter/material.dart';

class Solution extends StatefulWidget {
  const Solution({super.key});
  @override
  State<Solution> createState() => _SolutionState();
}

class _SolutionState extends State<Solution> {
  String text = "None";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.home, size: 40),
                  Icon(Icons.favorite, size: 40),
                  Icon(Icons.settings, size: 40),
                ],
              ),
            ),
            SizedBox(width: double.infinity, height: 20),
            Text("Selected: $text"),
            SizedBox(width: double.infinity, height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  text = "Favorite";
                });
              },
              child: Text("Select Favorite"),
            ),
          ],
        ),
      ),
    );
  }
}
