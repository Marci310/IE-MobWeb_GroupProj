import 'package:fitizens/posedetector/vision_detector/pose_detector_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'playback_screen.dart';

class VideoFeedScreen extends StatefulWidget {
  @override
  _VideoFeedScreenState createState() => _VideoFeedScreenState();
}

class _VideoFeedScreenState extends State<VideoFeedScreen> {
  bool _record = true;
  String title = 'Start Recording';
  String _selectedItem = 'sensor1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Feed'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.grey,
              width: 250.0,
              height: 250.0,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Video'),
                  const SizedBox(height: 20),
                  Container(
                      margin: EdgeInsets.all(10.0),
                      color: Colors.grey,
                      width: 250.0,
                      height: 250.0,
                      child: PoseDetectorView()),
                ],
              )),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: _record ? Colors.green : Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16)),
                onPressed: () {
                  setState(() {
                    _record = !_record;
                    title = 'End Recording';
                  });
                  if (_record) {
                    context.push('/viewrecording');
                    title = 'Start Recording';
                  }
                },
                child: Text(title.toString())),
            Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.grey,
              width: 250.0,
              height: 250.0,
              child: const Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sensor Log'),
                ],
              )),
            ),
            DropdownButton<String>(
              disabledHint: Text(_selectedItem),
              value: _selectedItem,
              onChanged: _record
                  ? (value) => setState(() => _selectedItem = value!)
                  : null,
              items: <String>['sensor1', 'sensor2']
                  .map<DropdownMenuItem<String>>((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
