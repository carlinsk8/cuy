import 'package:get_it/get_it.dart';

import '../../auth/data/repositories/auth_repository_impl.dart';
import '../../auth/domain/repositories/auth_repository.dart';

initRepository(GetIt sl) {

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      userLocalDataSource: sl(),
      authDataSource: sl()
    ),
  );

}
