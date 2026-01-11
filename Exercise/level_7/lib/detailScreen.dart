import 'package:flutter/material.dart';

class Detailscreen extends StatelessWidget {
  const Detailscreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Welcome to Details Screen"),
          SizedBox(width: double.infinity, height: 20.0),
          ElevatedButton(
            child: Text("Go Back"),
            onPressed: () => {
              Navigator.pop(context),
            },
          ),
        ],
      ),
    );
  }
}
