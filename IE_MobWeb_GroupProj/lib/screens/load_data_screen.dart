import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'file_viewer.dart';

class LoadDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Load Data'),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 5, // Number of workouts, replace with actual count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Workout ${index + 1}'),
            onTap: () {
              context.push('/viewprev');
            },
          );
        },
      ),
    );
  }
}
