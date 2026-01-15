import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "YES");
              },
              child: Text("Return YES"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "NO");
              },
              child: Text("Return NO"),
            ),
          ],
        ),
      ),
    );
  }
}
