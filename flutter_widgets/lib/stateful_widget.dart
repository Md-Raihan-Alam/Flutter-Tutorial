import 'package:flutter/material.dart';

class StatefulExample extends StatefulWidget {
  const StatefulExample({super.key});

  @override
  _StatefulExampleState createState() => _StatefulExampleState();
}

class _StatefulExampleState extends State<StatefulExample> {
  String buttonText = "Initial Text"; // State variable to hold button text
  List<String> items = []; // State variable to hold list of items

  @override
  void initState() {
    super.initState();
    // Initialize any data or start any processes needed before the UI builds
    items = [
      "Item 1",
      "Item 2",
      "Item 3"
    ]; // Initializing the list with default items
  }

  void _addItem(String item) {
    setState(() {
      items.add(item); // Add a new item to the list and update the state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Whole base layout of our app
      appBar: AppBar(
        // How our app bar is going to be
        title: const Text("My bar"), // Title in our app bar
        centerTitle: true, // Align our title to center
      ),
      body: /* In body, all will be after app bar */ Padding(
        // Adding padding around the column
        padding:
            const EdgeInsets.all(20.0), // Padding of 20.0 pixels on all sides
        child: Column(
          // Column widget to organize children widgets vertically
          mainAxisAlignment: MainAxisAlignment
              .center, // Align children vertically in the center
          crossAxisAlignment: CrossAxisAlignment
              .center, // Align children horizontally in the center
          children: [
            // List of children widgets
            Container(
              width: 200, // Width of the container
              height: 200, // Height of the container
              margin: const EdgeInsets.only(
                  bottom: 20.0), // Margin of the container
              decoration: BoxDecoration(
                // BoxDecoration to style the container
                gradient: const LinearGradient(
                  // LinearGradient for gradient background
                  colors: [
                    Colors.red,
                    Colors.orange
                  ], // Colors for the gradient
                  stops: [0.0, 1.0], // Stops for the gradient colors
                  begin: Alignment.topLeft, // Start point for the gradient
                  end: Alignment.bottomRight, // End point for the gradient
                  transform: GradientRotation(0.5), // Transform the gradient
                ),
                border: Border.all(
                  // Border property
                  color: Colors.black, // Border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(15.0), // Border radius
                boxShadow: [
                  // Box shadow property
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  /* To write text and style in Flutter */
                  "Learning 1",
                  style: TextStyle(
                    fontSize: 20, // Font size of the text
                    color: Colors.white, // Color of the text
                  ),
                ),
              ),
            ),
            Container(
              width: 200, // Width of the container
              height: 200, // Height of the container
              margin: const EdgeInsets.only(
                  bottom: 20.0), // Margin of the container
              decoration: BoxDecoration(
                // BoxDecoration to style the container
                gradient: const LinearGradient(
                  // LinearGradient for gradient background
                  colors: [
                    Colors.blue,
                    Colors.purple
                  ], // Colors for the gradient
                  stops: [0.0, 1.0], // Stops for the gradient colors
                  begin: Alignment.topRight, // Start point for the gradient
                  end: Alignment.bottomLeft, // End point for the gradient
                  transform: GradientRotation(0.5), // Transform the gradient
                ),
                border: Border.all(
                  // Border property
                  color: Colors.black, // Border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(15.0), // Border radius
                boxShadow: [
                  // Box shadow property
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  /* To write text and style in Flutter */
                  "Learning 2",
                  style: TextStyle(
                    fontSize: 20, // Font size of the text
                    color: Colors.white, // Color of the text
                  ),
                ),
              ),
            ),
            ElevatedButton(
              // ElevatedButton widget for a raised button
              onPressed: () {
                // Function to execute when the button is pressed
                setState(() {
                  buttonText = "Button Pressed!"; // Update the state
                });
              },
              style: ElevatedButton.styleFrom(
                // Styling for the button
                backgroundColor: Colors.green, // Background color of the button
                textStyle:
                    const TextStyle(fontSize: 20), // Text style of the button
              ),
              child: Text(buttonText), // Text displayed on the button
            ),
            TextButton(
              // TextButton widget for a text button
              onPressed: () {
                // Add new item to the list when the button is pressed
                _addItem("New Item");
              },
              style: TextButton.styleFrom(
                // Styling for the button
                backgroundColor: Colors.blue, // Background color of the button
                textStyle:
                    const TextStyle(fontSize: 20), // Text style of the button
              ),
              child: const Text('Add Item'), // Text displayed on the button
            ),
            IconButton(
              // IconButton widget for an icon button
              onPressed:
                  () {}, // Function to execute when the button is pressed
              icon: const Icon(Icons.add), // Icon displayed on the button
              iconSize: 40, // Size of the icon
              color: Colors.red, // Color of the icon
            ),
            OutlinedButton(
              // OutlinedButton widget for an outlined button
              onPressed:
                  () {}, // Function to execute when the button is pressed
              style: OutlinedButton.styleFrom(
                // Styling for the button
                backgroundColor:
                    Colors.orange, // Background color of the button
                side: const BorderSide(
                    color: Colors.orange), // Border color of the button
                textStyle:
                    const TextStyle(fontSize: 20), // Text style of the button
              ),
              child:
                  const Text('Outlined Button'), // Text displayed on the button
            ),
            SizedBox(
              height: 20.0, // Height of the SizedBox
            ),
            Expanded(
              child: ListView.builder(
                // ListView.builder to display list of items
                itemCount: items.length, // Number of items in the list
                itemBuilder: (context, index) {
                  return ListTile(
                    // ListTile widget for each item
                    title: Text(items[index]), // Text of the item
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
