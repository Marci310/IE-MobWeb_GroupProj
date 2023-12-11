import 'dart:async';
import 'package:flutter/material.dart';
import 'device.dart';
import 'deviceconnectionstatus.dart';
import 'movesensemodel.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class ScanButton extends StatefulWidget {
  @override
  _ScanButtonState createState() => _ScanButtonState();
}

class _ScanButtonState extends State<ScanButton> {
  late MovesenseModel model;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    model = Provider.of<MovesenseModel>(context, listen: false);
    model.onDeviceMdsConnected((device) => {
          model.set(device),
          const SnackBar(content: Center(child: Text('Device Connected'))),
        });
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;

    Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
    ].request();
    debugPrint("PermissionStatus: $statuses");
  }

  void onScanButtonPressed() {
    if (model.isScanning) {
      model.stopScan();
    } else {
      model.startScan();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 40,
      child: Scaffold(body: Consumer<MovesenseModel>(
        builder: (context, model, child) {
          return Center(
            child: ElevatedButton(
              onPressed: onScanButtonPressed,
              child: Text(model.scanButtonText),
            ),
          );
        },
      )),
    );
  }
}
