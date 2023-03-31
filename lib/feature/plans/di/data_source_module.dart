import 'package:get_it/get_it.dart';
import '../data/datasources/plans_data_source.dart';

initDataSource(GetIt sl) {
  sl.registerLazySingleton<PlansDataSource>(
    () => PlansDataSourceImpl(
      authHttpClient: sl(),
    ),
  );

}
