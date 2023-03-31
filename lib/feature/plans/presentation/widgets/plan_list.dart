import 'package:flutter/material.dart';

class PlanList extends StatelessWidget {
  const PlanList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) { 
          return const ListTile(
            title: Text('1GB'),
            trailing: Text('20 s/'),
            subtitle: Text('30 dias'),
          );
         }, itemCount: 20, 
         separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}