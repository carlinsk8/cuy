
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../generated/l10n.dart';
import '../providers/plans_provider.dart';

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

  PlansProvider? provider;
  Map? info;
  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      provider = Provider.of<PlansProvider>(context, listen: false);
      await provider?.getInfoDevice();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
  
    return  Scaffold(
      appBar: AppBar(
        title:  Text(S.of(context).infoDevice),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _itemRow('${S.of(context).appName}: ',provider?.infoDevice?.appName ?? ''),
            _itemRow('${S.of(context).appID}: ', provider?.infoDevice?.appId ?? ''),
            _itemRow('${S.of(context).versionApp}: ', provider?.infoDevice?.versionName ?? ''),
            _itemRow('${S.of(context).brandModel}: ','${provider?.infoDevice?.brand ?? ''}/${provider?.infoDevice?.model ?? ''}'),
            _itemRow('${S.of(context).os}: ', provider?.infoDevice?.android ?? ''),
            _itemRow('${S.of(context).lang}: ',provider?.infoDevice?.locale ?? ''),
          ],
        ),
      ),
   );
  }

  Row _itemRow(String key, String value) {
    return Row(
      children: [
        Text(key,style: const TextStyle(fontWeight: FontWeight.w500)),
        Text(value),
      ],
    );
  }
}