import 'package:flutter/material.dart';

class VideoFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      color: Colors.grey,
      width: 48.0,
      height: 48.0,
      child: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Video'),
        ],
      )),
    );
  }
}
