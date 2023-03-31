
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../widgets/plan_list.dart';

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
          const PlanList()
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
}

