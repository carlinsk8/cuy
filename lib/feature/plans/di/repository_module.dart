import 'package:get_it/get_it.dart';

import '../data/repositories/plan_repository_impl.dart';
import '../domain/repositories/plan_repository.dart';

initRepository(GetIt sl) {

  sl.registerLazySingleton<PlansRepository>(
    () => PlansRepositoryImpl(
      infoDeviceLocalDatasource: sl(),
      plansDataSource: sl()
    ),
  );

}
