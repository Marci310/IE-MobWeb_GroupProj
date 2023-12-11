import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mdsflutter/Mds.dart';

class DeviceModel extends ChangeNotifier {
  String? _serial;
  String? _name;

  String? get name => _name;
  String? get serial => _serial;

  StreamSubscription? _accSubscription;
  bool get accelerometerSubscribed => _accSubscription != null;

  StreamSubscription? _hrSubscription;
  bool get hrSubscribed => _hrSubscription != null;

  StreamSubscription? _tempSubscription;
  bool get tempSubscribed => _tempSubscription != null;

  StreamSubscription? _gyroSubscription;
  bool get gyroSubscribed => _gyroSubscription != null;

  String _data = "";
  String get data => _data;

  DeviceModel(this._name, this._serial);

  @override
  void dispose() {
    _accSubscription?.cancel();
    _hrSubscription?.cancel();
    _gyroSubscription?.cancel();
    _tempSubscription?.cancel();
    super.dispose();
  }

  void subscribeToAccelerometer() {
    _data = "";
    _accSubscription = MdsAsync.subscribe(
            Mds.createSubscriptionUri(_serial!, "/Meas/Acc/104"), "{}")
        .listen((event) {
      _onNewAccelerometerData(event);
    });

    notifyListeners();
  }

  void _onNewAccelerometerData(dynamic accData) {
    Map<String, dynamic> body = accData["Body"];
    List<dynamic> accArray = body["ArrayAcc"];
    dynamic acc = accArray.last;
    _data += "x: " +
        acc["x"].toStringAsFixed(2) +
        "\ny: " +
        acc["y"].toStringAsFixed(2) +
        "\nz: " +
        acc["z"].toStringAsFixed(2) +
        '\n';
    notifyListeners();
  }

  void unsubscribeFromAccelerometer() {
    _data = "";
    if (_accSubscription != null) {
      _accSubscription!.cancel();
    }
    _accSubscription = null;
    notifyListeners();
  }

  void subscribeToGyroscope() {
    _data = "";
    _gyroSubscription = MdsAsync.subscribe(
            Mds.createSubscriptionUri(_serial!, "/Meas/Gyro/104"), "{}")
        .listen((event) {
      _onNewGyroscopeData(event);
    });

    notifyListeners();
  }

  void _onNewGyroscopeData(dynamic gyroData) {
    Map<String, dynamic> body = gyroData["Body"];
    List<dynamic> gyroArray = body["ArrayAcc"];
    dynamic gyro = gyroArray.last;
    _data += "x: " +
        gyro["x"].toStringAsFixed(2) +
        "\ny: " +
        gyro["y"].toStringAsFixed(2) +
        "\nz: " +
        gyro["z"].toStringAsFixed(2) +
        '\n';
    notifyListeners();
  }

  void unsubscribeFromGyroscope() {
    _data = "";
    if (_gyroSubscription != null) {
      _gyroSubscription!.cancel();
    }
    _gyroSubscription = null;
    notifyListeners();
  }

  void subscribeToHr() {
    _data = "";
    _hrSubscription = MdsAsync.subscribe(
            Mds.createSubscriptionUri(_serial!, "/Meas/HR"), "{}")
        .listen((event) {
      _onNewHrData(event);
    });
    notifyListeners();
  }

  void _onNewHrData(dynamic hrData) {
    Map<String, dynamic> body = hrData["Body"];
    double hr = body["average"];
    _data += hr.toStringAsFixed(1) + " bpm\n";
    notifyListeners();
  }

  void unsubscribeFromHr() {
    _data = "";
    if (_hrSubscription != null) {
      _hrSubscription!.cancel();
    }
    _hrSubscription = null;
    notifyListeners();
  }

  void subscribeToTemp() {
    _data = "";
    _hrSubscription = MdsAsync.subscribe(
            Mds.createSubscriptionUri(_serial!, "/Meas/Temp"), "{}")
        .listen((event) {
      _onNewTempData(event);
    });
    notifyListeners();
  }

  void _onNewTempData(dynamic tempData) {
    Map<String, dynamic> body = tempData["Body"];
    double kelvin = body["Measurement"];
    double temperatureVal = kelvin - 273.15;
    _data += temperatureVal.toStringAsFixed(1) + " C\n";
    notifyListeners();
  }

  void unsubscribeFromTemp() {
    _data = "";
    if (_tempSubscription != null) {
      _tempSubscription!.cancel();
    }
    _tempSubscription = null;
    notifyListeners();
  }
}
