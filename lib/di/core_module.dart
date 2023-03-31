import 'package:get_it/get_it.dart';

import '../core/api/auth_client.dart';
import '../core/api/public_http_client.dart';
import '../core/util/validator.dart';

initCore(GetIt sl) {
  sl.registerLazySingleton(() => Validator());
  sl.registerLazySingleton(
    () => AuthHttpClient(
      userLocalDataSource: sl(),
      publicHttpClient: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => PublicHttpClient(),
  );

}
