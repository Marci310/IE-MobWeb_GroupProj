import 'package:flutter/material.dart';
import 'devicemodel.dart';
import 'package:provider/provider.dart';
import 'device.dart';
import 'movesensemodel.dart';

class DeviceInteractionWidget extends StatefulWidget {
  final Device device;
  final String measurements;
  const DeviceInteractionWidget(this.device, this.measurements);

  @override
  State<StatefulWidget> createState() {
    return _DeviceInteractionWidgetState();
  }
}

class _DeviceInteractionWidgetState extends State<DeviceInteractionWidget> {
  late AppModel _appModel;

  @override
  void initState() {
    super.initState();
    _appModel = Provider.of<AppModel>(context, listen: false);
    _appModel.onDeviceMdsDisconnected((device) => Navigator.pop(context));
  }

  @override
  void dispose() {
    _appModel.disconnectFromDevice(widget.device);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Device device = widget.device;
    return ChangeNotifierProvider(
      create: (context) => DeviceModel(device.name, device.serial),
      child: Consumer<DeviceModel>(
        builder: (context, model, child) {
          subscribetodata(model);
          return _deviceData(model);
        },
      ),
    );
  }

  Widget _deviceData(DeviceModel deviceModel) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        width: 250.0,
        height: 250.0,
        child: Expanded(
            flex: 1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(deviceModel.data),
            )));
  }

  subscribetodata(DeviceModel deviceModel) {
    switch (widget.measurements) {
      case ('accelerometer'):
        deviceModel.subscribeToAccelerometer();
        break;
      case ('heartrate'):
        deviceModel.subscribeToHr();
        break;
      case ('tempearure'):
        deviceModel.subscribeToTemp();
        break;
      case ('gyroscope'):
        deviceModel.subscribeToTemp();
    }
  }
}
