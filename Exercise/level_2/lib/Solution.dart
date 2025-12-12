import 'package:flutter/material.dart';

class Solution extends StatefulWidget {
  const Solution({super.key});
  @override
  State<Solution> createState() => _SolutionState();
}

class _SolutionState extends State<Solution> {
  Color _cardColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Card(
                color: _cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Welcome to Level 2",
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: double.infinity, height: 10.0),
                      Text(
                        "This is a styled card",
                        style: TextStyle(fontSize: 16.0, color: Colors.grey),
                      ),
                      SizedBox(width: double.infinity, height: 10.0),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _cardColor = _cardColor == Colors.white
                                  ? Colors.blue.shade100
                                  : Colors.white;
                            });
                          },
                          child: Text("Change Color"))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
