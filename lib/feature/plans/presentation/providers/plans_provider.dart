import 'dart:async';

import 'package:cuy_test/core/usecases/use_case.dart';
import 'package:cuy_test/feature/plans/domain/entities/plan.dart';
import 'package:flutter/material.dart';

import '../../../../shared/view_state.dart';
import '../../domain/entities/info_device.dart';
import '../../domain/usecase/get_info_device_use_case.dart';
import '../../domain/usecase/get_plan_list_use_case.dart';

class PlansProvider extends ChangeNotifier {
  PlansProvider({
    required this.getPlanListUseCase,
    required this.getInfoDevicetUseCase,
  });

  final GetPlanListUseCase getPlanListUseCase;

  final GetInfoDevicetUseCase getInfoDevicetUseCase;

  ViewState state = Idle();

  List<Plan> _list = [];
  final list = StreamController<List<Plan>>.broadcast();
  Stream<List<Plan>> get stream => list.stream;

  InfoDevice? infoDevice;


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

  Future<void> getInfoDevice() async {
    state = Loading();
    notifyListeners();
    final result = await getInfoDevicetUseCase(NoParams());

    result.fold(
      (failure) => state = Error(failure: failure),
      (data) {
        infoDevice = data;
        state = Loaded();
      },
    );
    notifyListeners();
  }
}
