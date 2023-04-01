import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'di/injection_container.dart';
import 'feature/auth/presentation/providers/auth_provider.dart';
import 'feature/plans/presentation/providers/plans_provider.dart';
import 'feature/splash/presentation/provider/splash_provider.dart';

class Providers {
  static List<SingleChildWidget>  list = [
    ListenableProvider<AuthProvider>(create: (_) => sl<AuthProvider>()),
    ListenableProvider<PlansProvider>(create: (_) => sl<PlansProvider>()),
    ListenableProvider<SplashProvider>(create: (_) => sl<SplashProvider>()),
  ];
}