import 'package:flutter/foundation.dart';

// RecordingsModel
// A RecordingsModel is a ChangeNotifier that stores the list of saved recordings
// and holds the methods that allow for adding and deleting the recordings.

class RecordingsModel with ChangeNotifier {
  final List<String> _recordings = [];

  List<String> get recordings => List.unmodifiable(_recordings);

  void addRecording(String newRecording) {
    _recordings.add(newRecording);
    notifyListeners();
  }

  void deleteRecording(int index) {
    if (index >= 0 && index < _recordings.length) {
      _recordings.removeAt(index);
      notifyListeners();
    }
  }
}
