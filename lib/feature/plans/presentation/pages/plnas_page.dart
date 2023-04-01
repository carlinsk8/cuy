
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../widgets/plan_list.dart';
import 'info_device_page.dart';

class PlansPage extends StatelessWidget {
  static const id = 'plans_page';

  const PlansPage({super.key});

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildTitle(context),
          const PlanList(),

          _buildSendBottom(context)
          
        ],
      ),
   );
  }

  Widget _buildTitle(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Text(S.of(context).planList, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }

  Widget _buildSendBottom(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Theme.of(context).colorScheme.primary,
          minimumSize: const Size.fromHeight(52),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
        ),
        onPressed: () async {
          InfoDevicePage.pushNavigate(context);
        },
        child: const Text(
          'Obtener info del dispositivo',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

