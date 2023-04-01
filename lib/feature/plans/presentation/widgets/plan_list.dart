import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/plan.dart';
import '../providers/plans_provider.dart';

class PlanList extends StatefulWidget {
  const PlanList({
    super.key,
  });

  @override
  State<PlanList> createState() => _PlanListState();
}

class _PlanListState extends State<PlanList> {

  PlansProvider? provider;
  @override
  void initState() {
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      provider = Provider.of<PlansProvider>(context, listen: false);
      await provider?.getList('ASC');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final providert = Provider.of<PlansProvider>(context, listen: false);
    return Expanded(
      child: StreamBuilder<List<Plan>>(
        stream: providert.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.isEmpty ?? true) {
              return const Center( child: Text('No hay datos'),);
            } else {
              final items = snapshot.data!;
              return ListView.separated(
                itemBuilder: (_, int i) { 
                  return _item(items[i]);
                }, itemCount: items.length, 
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              );
            }
          }else if (snapshot.hasError) {
            return const Center( child: Text('Ha ocurrido un error inesperado'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }

  ListTile _item(Plan item) {
    return ListTile(
      title: Text('Paquete - ${item.name}'),
      trailing: Text('${item.price} S/'),
      subtitle: Text('${item.duration} dias'),
    );
  }
  
  Future<void> getData() async {
    
    
  }
}