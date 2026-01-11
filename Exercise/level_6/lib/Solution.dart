import 'package:flutter/material.dart';

class Solution extends StatefulWidget {
  const Solution({super.key});

  @override
  State<Solution> createState() => _SolutionState();
}

class _SolutionState extends State<Solution> {
  String selected = "None";
  var animals = ["Dog", "Cat", "Bird"];
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Selected Animal: $selected",
              style: TextStyle(color: Colors.green),
            ),
            SizedBox(width: double.infinity, height: 20.0),
            Expanded(
                child: ListView.separated(
              itemCount: animals.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    animals[index],
                  ),
                  onTap: () {
                    setState(() {
                      selected = animals[index];
                      selectedIndex = index;
                    });
                  },
                  tileColor: selectedIndex == index
                      ? Colors.orange.shade100
                      : Colors.white,
                );
              },
              separatorBuilder: (context, index) {
                return Divider(color: Colors.blue, thickness: 1);
              },
            )),
          ],
        ),
      ),
    );
  }
}
