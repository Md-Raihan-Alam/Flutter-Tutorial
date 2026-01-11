import 'package:flutter/material.dart';
import 'package:level_8/details.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final tools = ["Flutter", "Dart", "Firebase"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Select from below:"),
            SizedBox(width: double.infinity, height: 20.0),
            SizedBox(
              width: double.infinity,
              height: 200.0,
              child: ListView.builder(
                itemCount: tools.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tools[index]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailsScreen(tool: tools[index]),
                        ),
                      );
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
