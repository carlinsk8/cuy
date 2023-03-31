import 'package:flutter/material.dart';

import 'app.dart';
import 'route.dart';

import '../../../../../di/injection_container.dart' as di;

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // init dependency injection.
  await di.init();
  // init routes.
  AppRoute.init();

  runApp(const App());
} 

