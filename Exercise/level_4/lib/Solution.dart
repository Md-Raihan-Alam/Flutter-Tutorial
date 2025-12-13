import 'package:flutter/material.dart';

class Solution extends StatefulWidget {
  const Solution({super.key});
  @override
  State<Solution> createState() => _SolutionState();
}

class _SolutionState extends State<Solution> {
  Color boxColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                color: boxColor,
                border: Border.all(
                  color: Colors.black,
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Text(
                  "Level 4 Box",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
            SizedBox(width: double.infinity, height: 10.0),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    boxColor =
                        boxColor == Colors.blue ? Colors.green : Colors.blue;
                  });
                },
                child: Text("Change Color"))
          ],
        ),
      ),
    );
  }
}
