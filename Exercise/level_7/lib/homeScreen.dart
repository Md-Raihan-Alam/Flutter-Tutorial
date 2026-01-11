import 'package:flutter/material.dart';
import 'package:level_7/detailScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Home Screen"),
          SizedBox(width: double.infinity, height: 20.0),
          ElevatedButton(
            child: Text("Go to Details Screen"),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Detailscreen()),
              ),
            },
          ),
        ],
      ),
    );
  }
}
