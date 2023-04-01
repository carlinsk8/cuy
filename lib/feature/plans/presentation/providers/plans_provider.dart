import 'dart:async';

import 'package:cuy_test/feature/plans/domain/entities/plan.dart';
import 'package:flutter/material.dart';

import '../../../../shared/view_state.dart';
import '../../domain/usecase/get_plan_list_use_case.dart';

class PlansProvider extends ChangeNotifier {
  PlansProvider({required this.getPlanListUseCase});

  final GetPlanListUseCase getPlanListUseCase;

  ViewState state = Idle();

  List<Plan> _list = [];
  final list = StreamController<List<Plan>>.broadcast();
  Stream<List<Plan>> get stream => list.stream;

  Future<void> getList(String sort) async {
    state = Loading();
    notifyListeners();
    final result = await getPlanListUseCase(sort);

    result.fold(
      (failure) => state = Error(failure: failure),
      (listings) {
        _list = [];
        _list.addAll(listings);
        list.sink.add(_list);
        state = Loaded();
      },
    );
    notifyListeners();
  }
}
