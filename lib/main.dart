import 'package:flutter/material.dart';
import 'dart:math';

// Entry point of the application
void main() {
  runApp(MyApp());
}

// Main application widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AquariumScreen(), // Set AquariumScreen as the default screen
    );
  }
}

// Aquarium screen widget
class AquariumScreen extends StatefulWidget {
  @override
  _AquariumScreenState createState() => _AquariumScreenState();
}

// State of the aquarium screen
class _AquariumScreenState extends State<AquariumScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();
  Offset _fishPosition = Offset(150, 150); // Initial position in the center

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250), // Move every quarter second
      vsync: this,
    )..repeat(); // Repeat the animation indefinitely

    // Update fish position periodically
    _controller.addListener(() {
      setState(() {
        _fishPosition = Offset(
          (_fishPosition.dx + 2) % 300,
          (_fishPosition.dy + 2) % 300,
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              child: Stack(
                children: [
                  Positioned(
                    left: _fishPosition.dx,
                    top: _fishPosition.dy,
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.orange, // Fish color
                        shape: BoxShape.circle, // Circular shape
                      ),
                    ),
                  ),
                ],
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
