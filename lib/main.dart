import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import '/controller/camera_controller.dart';

late List<CameraDescription> _cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _cameras = await availableCameras();
  runApp(const CameraWidget());
}
