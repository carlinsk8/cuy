import 'package:get_it/get_it.dart';

import '../../auth/domain/usecases/login_use_case.dart';

initUseCase(GetIt sl) {
  sl.registerLazySingleton(
    () => LoginUseCase(authRepository: sl()),
  );
  
}
