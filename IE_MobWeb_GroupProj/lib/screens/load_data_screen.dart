import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '/recordings_model.dart';

// LoadDataScreen
// A LoadDataScreen is a StatelessWidget that displays the list of saved recordings.
// The user can delete a recording by pressing the delete button.
// The user can also view the data by clicking on the recording, which will take them to the file viewer screen.
class LoadDataScreen extends StatelessWidget {
  void _showDeleteConfirmation(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Recording'),
          content:
              const Text('Are you sure you want to delete this recording?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                Provider.of<RecordingsModel>(context, listen: false)
                    .deleteRecording(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
      body: Consumer<RecordingsModel>(
        builder: (context, recordingsModel, child) {
          return ListView.builder(
            itemCount: recordingsModel.recordings.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(recordingsModel.recordings[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _showDeleteConfirmation(context, index),
                ),
                onTap: () {
                  context.push('/viewprev');
                },
              );
            },
          );
        },
      ),
    );
  }
}
