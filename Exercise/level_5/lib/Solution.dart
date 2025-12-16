import 'package:flutter/material.dart';

class Solution extends StatefulWidget {
  const Solution({super.key});
  @override
  State<Solution> createState() => _SolutionState();
}

class _SolutionState extends State<Solution> {
  String selected = "None";
  var fruits = ["Apple", "Banana", "Orange"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("selected $selected"),
            SizedBox(width: double.infinity, height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: fruits.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(fruits[index]),
                    onTap: () {
                      setState(() {
                        selected = fruits[index];
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
