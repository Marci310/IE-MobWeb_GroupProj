import 'package:flutter/material.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String dropdownValue = 'Select Sensor'; // Default dropdown value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('scan_screen.dart'),
        centerTitle: true, // Center the title if that's needed
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch the children to take full width
          children: <Widget>[
            DropdownButton<String>(
              isExpanded: true, // Make the dropdown full width
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
              if (newValue != null) {
              setState(() {
                dropdownValue = newValue;
              });
               }
              },
              items: <String>['Select Sensor', 'Sensor 1', 'Sensor 2', 'Sensor 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20), // Space between dropdown and first button
            ElevatedButton(
              onPressed: () {
                // Placeholder for start new workout functionality
              },
              child: const Text('Start New Workout'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0), // Rounded corners
                ),
                primary: Colors.blue, // Button color
                onPrimary: Colors.white, // Text color
              ),
            ),
            const SizedBox(height: 20), // Space between buttons
            ElevatedButton(
              onPressed: () {
                // Placeholder for view previous workouts functionality
              },
              child: const Text('View Previous Workouts'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0), // Rounded corners
                ),
                primary: Colors.blue, // Button color
                onPrimary: Colors.white, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}