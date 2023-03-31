import 'package:flutter/material.dart';

import '../../../../shared/view_state.dart';
import '../../domain/usecase/get_plan_list_use_case.dart';

class PlansProvider extends ChangeNotifier {
  PlansProvider({required this.getPlanListUseCase});

  final GetPlanListUseCase getPlanListUseCase;

  ViewState state = Idle();


  Future<void> login(String email, String password) async {
    state = Loading();
    notifyListeners();
    final result = await getPlanListUseCase(email);

    result.fold(
      (failure) => state = Error(failure: failure),
      (ok) => state = Loaded(value: ok),
    );
    notifyListeners();
  }
}
