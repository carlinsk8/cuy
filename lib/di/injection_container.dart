import 'package:get_it/get_it.dart';

import '../feature/auth/di/auth_module.dart';
import '../feature/plans/di/plnas_module.dart';
import 'core_module.dart';
import 'external_module.dart';

final sl = GetIt.instance;

init() async {
  await initExternal(sl);

  initCore(sl);

  initAuthModule(sl);
  initPlansModule(sl);
}
