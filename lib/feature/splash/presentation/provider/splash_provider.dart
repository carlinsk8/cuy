
import 'package:cuy_test/core/usecases/use_case.dart';
import 'package:flutter/material.dart';

import '../../../../shared/view_state.dart';
import '../../../auth/domain/usecases/get_token_use_case.dart';

class SplashProvider extends ChangeNotifier {
  SplashProvider({required this.getTokenUseCase});

  final GetTokenUseCase getTokenUseCase;
  ViewState state = Idle();


  Future<void> getToken() async {
    state = Loading();
    notifyListeners();
    final result = await getTokenUseCase(NoParams());

    result.fold(
      (failure) => state = Error(failure: failure),
      (token) => state = Loaded(value: token),
    );
    notifyListeners();
  }
}
