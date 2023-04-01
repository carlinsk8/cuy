import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InfoDevicePage extends StatefulWidget {
  const InfoDevicePage({super.key});

  static const id = 'info_device_page';

  static Future<T?> pushNavigate<T extends Object?>(
    BuildContext context, {
    bool replace = false,
  }) {
    return replace
        ? Navigator.pushNamedAndRemoveUntil(
            context,
            id,
            (route) => false,
          )
        : Navigator.pushNamed(context, id);
  }

  @override
  State<InfoDevicePage> createState() => _InfoDevicePageState();
}

class _InfoDevicePageState extends State<InfoDevicePage> {

  static const platform = MethodChannel('flutter/getinfo');

  void getinfo() async {
    try {
      final result = await  platform.invokeMethod('info',<String, Object?>{});
    } on PlatformException catch (e) {
      print('Exception: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hola Mundo'),
     ),
   );
  }
}