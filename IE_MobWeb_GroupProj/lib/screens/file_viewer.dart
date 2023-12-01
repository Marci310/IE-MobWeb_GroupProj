import 'package:flutter/material.dart';

class FileViewerScreen extends StatefulWidget {
  @override
  _FileViewerScreenState createState() => _FileViewerScreenState();
}

class _FileViewerScreenState extends State<FileViewerScreen> {
  bool _playing = true;
  String title = 'Play';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Viewer'),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                    backgroundColor: _playing ? Colors.green : Colors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16)),
                onPressed: () {
                  setState(() {
                    _playing = !_playing;
                    title = 'Stop';
                  });
                  if (_playing) {
                    title = 'Play';
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
          ])),
    );
  }
}
