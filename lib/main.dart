import 'package:flutter/material.dart';
import 'screens/scan_screen.dart'; // Make sure this import points to the file where ScanScreen is defined

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScanScreen(), // Replace the Scaffold with ScanScreen
    );
  }
}
