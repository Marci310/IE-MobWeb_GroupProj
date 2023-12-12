import 'package:fitizens/navigation/Router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'video_feed.dart';
import 'load_data_screen.dart';
import 'package:fitizens/network/connectbutton.dart';
import 'package:fitizens/network/movesensemodel.dart';

// ScanScreen
// A ScanScreen is the first screen the viewer sees when they open the Fitizens app.
// It's main functionality allows the user to connect to the Fitizens sensor before beginning a workout
// (recorded data from the video enabled with pose detection and simultaneous to the sensor).
// The user can also view previous workouts by pressing the view previous workouts button.

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String selectedSensor = 'Select Sensor';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan for Sensors'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ScanButton(),
              const SizedBox(
                  height: 20), // Spacing between dropdown and buttons
              ElevatedButton(
                onPressed: () => context.push('/newvideo'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('Start New Workout'),
              ),
              const SizedBox(height: 20), // Spacing between buttons
              ElevatedButton(
                onPressed: () => context.push('/viewsaves'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('View Previous Workouts'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
