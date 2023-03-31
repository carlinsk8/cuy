import 'package:flutter/material.dart';

import '../../../../shared/view_state.dart';
import '../../domain/usecases/login_use_case.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider({required this.loginUseCase});

  final LoginUseCase loginUseCase;

  ViewState state = Idle();


  Future<void> login(String email, String password) async {
    final params = LoginUseCaseParams(
      email: email,
      password: password
    );
    state = Loading();
    notifyListeners();
    final result = await loginUseCase(params);

    result.fold(
      (failure) => state = Error(failure: failure),
      (ok) => state = Loaded(value: ok),
    );
    notifyListeners();
  }
}
