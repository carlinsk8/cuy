import 'package:get_it/get_it.dart';
import '../../auth/data/datasources/local/user_local_data_source.dart';
import '../../auth/data/datasources/remote/auth_data_source.dart';

initDataSource(GetIt sl) {
  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(
      publicHttpClient: sl(),
      userLocalDataSource: sl()
    ),
  );

}
