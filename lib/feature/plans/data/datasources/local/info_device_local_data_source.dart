import 'package:flutter/services.dart';

import '../../../domain/entities/info_device.dart';
import '../../models/info_device_model.dart';

abstract class InfoDeviceLocalDatasource {
  Future<InfoDevice> getInfoDevice();
}

class InfoDeviceLocalDatasourceImpl extends InfoDeviceLocalDatasource {
  static const platform = MethodChannel('samples.flutter.dev/battery');
  @override
  Future<InfoDevice> getInfoDevice() async {
    final Map<dynamic, dynamic> result = await platform.invokeMethod('getBatteryLevel');
    final data = InfoDeviceModel.fromJson(result);
    return data;
  }
}