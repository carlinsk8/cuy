
import 'package:cuy_test/feature/auth/presentation/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../generated/l10n.dart';
import '../providers/plans_provider.dart';
import '../widgets/plan_list.dart';
import 'info_device_page.dart';
enum SortType {
  asc,
  desc
}
extension SortTypeExt on SortType {
  String get value {
    switch (this) {
      case SortType.asc:
        return 'ASC';
      case SortType.desc:
        return 'DESC';
    }
  }
}
class PlansPage extends StatefulWidget {
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
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  int? selectedMenu;
  String sort = SortType.asc.name;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PlansProvider>(context, listen: false);
      
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).planList),
        actions: [
          _logout(context)
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               Text('${S.of(context).sort}:'),
              const SizedBox(width: 10),
              Text(SortType.asc.name),
              Radio<String>(value: SortType.asc.name, groupValue: sort, onChanged: (v) async {
                await provider.getList(v??SortType.asc.name);
                setState(() {
                  sort=v??SortType.asc.name;
                });
              }),
              Text(SortType.desc.name),
              Radio<String>(value: SortType.desc.name, groupValue: sort, onChanged: (v) async {
                await provider.getList(v??SortType.asc.name);
                setState(() {
                  sort=v??SortType.asc.name;
                });
              })
            ],
          ),
          const PlanList(),
          _buildSendBottom(context)
          
        ],
      ),
   );
  }

  PopupMenuButton<int> _logout(BuildContext context) {
    return PopupMenuButton<int>(
      icon: const Icon(Icons.more_vert, color: Colors.white,),
      initialValue: selectedMenu,
      onSelected: (int item) {
        AuthPage.pushNavigate(context,replace: true);
      },
      offset: const Offset(-5,0),
      shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),

      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        PopupMenuItem<int>(
          height: 35,
          value: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:   [
              const Icon(Icons.logout,color: Colors.black,),
              Text(S.of(context).logout),
            ],
          ),
        ),
      
      ],
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
        child: Text(
          S.of(context).titleInfoDevice,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

