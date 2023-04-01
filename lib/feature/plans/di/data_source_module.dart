import 'package:get_it/get_it.dart';
import '../data/datasources/local/info_device_local_data_source.dart';
import '../data/datasources/remote/plans_data_source.dart';

initDataSource(GetIt sl) {
  sl.registerLazySingleton<PlansDataSource>(
    () => PlansDataSourceImpl(
      authHttpClient: sl(),
    ),
  );

  sl.registerLazySingleton<InfoDeviceLocalDatasource>(
    () => InfoDeviceLocalDatasourceImpl(),
  );

}
