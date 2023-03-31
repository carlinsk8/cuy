import 'package:cuy_test/feature/plans/presentation/pages/plnas_page.dart';

import '../../../shared/app_router.dart';

initPlans() {
  AppRouter.appRouter
    .define(
      routePath: PlansPage.id,
      handler: AppRouteHandler(
        handlerFunc: (arguments) {
          return const PlansPage();
        },
      ),
    );
}