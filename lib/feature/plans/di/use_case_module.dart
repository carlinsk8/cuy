import 'package:get_it/get_it.dart';

import '../domain/usecase/get_info_device_use_case.dart';
import '../domain/usecase/get_plan_list_use_case.dart';

initUseCase(GetIt sl) {
  sl.registerLazySingleton(
    () => GetPlanListUseCase(planRepository: sl()),
  );
  
  sl.registerLazySingleton(
    () => GetInfoDevicetUseCase(planRepository: sl()),
  );
}
