import 'package:fitizens/network/devicelog.dart';
import 'package:fitizens/network/movesensemodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fitizens/network/device.dart';
import 'playback_screen.dart';
import 'package:provider/provider.dart';

// VideoFeedScreen
// A VideoFeedScreen allows the user to record a video and sensor log
// The user will film the athlete performing the exercise and the sensor will record the data
// The user can start and stop the recording by pressing the button
class VideoFeedScreen extends StatefulWidget {
  @override
  _VideoFeedScreenState createState() => _VideoFeedScreenState();
}

class _VideoFeedScreenState extends State<VideoFeedScreen> {
  bool _record = true;
  String title = 'Start Recording';
  String _selectedItem = 'accelerometer';
  late MovesenseModel model;
  @override
  void initState() {
    super.initState();
    model = Provider.of<MovesenseModel>(context, listen: false);
  }

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
              child: const Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Video'),
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
            DropdownButton<String>(
              disabledHint: Text(_selectedItem),
              value: _selectedItem,
              onChanged: _record
                  ? (value) => setState(() => _selectedItem = value!)
                  : null,
              items: <String>[
                'accelerometer',
                'heartrate',
                'tempearure',
                'gyroscope'
              ].map<DropdownMenuItem<String>>((item) {
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

  Widget sensorLog() {
    if (_record) {
      return Container(
        margin: const EdgeInsets.all(10.0),
        color: Colors.grey,
        width: 250.0,
        height: 250.0,
        child: const Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Log'),
          ],
        )),
      );
    } else
      return DeviceInteractionWidget(model.device, _selectedItem);
  }
}
