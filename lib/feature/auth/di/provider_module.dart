import 'package:get_it/get_it.dart';

import '../../auth/presentation/providers/auth_provider.dart';
import '../../splash/presentation/provider/splash_provider.dart';

initProvider(GetIt sl) {
  sl.registerFactory(
    () => AuthProvider(
      loginUseCase: sl()
    ),
  );
  sl.registerFactory(
    () => SplashProvider(
      getTokenUseCase: sl()
    ),
  );
}
