import 'package:get_it/get_it.dart';

import '../presentation/providers/plans_provider.dart';

initProvider(GetIt sl) {
  sl.registerFactory(
    () => PlansProvider(
      getPlanListUseCase: sl(),
      getInfoDevicetUseCase: sl(),
    ),
  );
  
}
