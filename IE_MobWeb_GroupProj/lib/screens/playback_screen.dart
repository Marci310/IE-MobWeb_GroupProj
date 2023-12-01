import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'load_data_screen.dart'; // Make sure this is imported
import 'video_feed.dart'; // Make sure this is imported

class PlaybackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playback'),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context); // This should just pop the current screen
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'File Name',
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () => context.pushReplacement('/viewsaves'),
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
