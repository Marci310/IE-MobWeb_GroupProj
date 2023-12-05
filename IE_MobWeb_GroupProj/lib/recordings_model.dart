import 'package:flutter/foundation.dart';

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
