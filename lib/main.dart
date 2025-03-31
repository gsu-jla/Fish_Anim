import 'package:flutter/material.dart';

// Entry point of the application
void main() {
  runApp(MyApp());
}

// Main application widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), // Set HomePage as the default screen
    );
  }
}

// Home page widget
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aquarium Time!'), // App bar title
        backgroundColor: Colors.purple, // Background color of the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            // Container for Aquarium
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.blueAccent, // Background color
                borderRadius: BorderRadius.circular(20), // Rounded corners
                border: Border.all(color: Colors.black, width: 3), // Border
              ),
              child: Center(
                child: Text(
                  'Aquarium View',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Button adding fish
            buildButton(context, 'Add Fish', Icons.add),
            SizedBox(height: 16),
            // Button for Settings
            buildButton(context, 'Save Settings', Icons.event_note),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Reusable button widget with title and icon
  Widget buildButton(BuildContext context, String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Rounded corners
        border: Border.all(color: Colors.black, width: 3), // Black border with thickness
      ),
      child: ListTile(
        title: Center(child: Text(title)), // Button title centered
        trailing: Icon(icon), // Icon displayed at the end
        onTap: () {}, // Button tap event (currently empty)
      ),
    );
  }
}
