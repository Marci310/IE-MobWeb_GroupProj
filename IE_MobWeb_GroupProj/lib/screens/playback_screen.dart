import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '/recordings_model.dart'; // Import the model

// PlaybackScreen
// The PlaybackScreen allows the user to view and save the video and sensor log files
// from the Fitizens sensor and camera. The user can save the files by pressing the save button,
// this will store them to be accessed via the load data screen.
// The user can also discard the files by pressing the discard button.
class PlaybackScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playback'),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context); // Pops the current screen
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 250,
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  hintText: 'File Name',
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<RecordingsModel>(context, listen: false)
                    .addRecording(_textController.text);
                context.pushReplacement('/viewsaves');
              },
              child: const Text('Save'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text('Discard'),
            ),
          ],
        ),
      ),
    );
  }
}
