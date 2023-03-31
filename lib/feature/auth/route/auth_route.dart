import '../../../shared/app_router.dart';
import '../presentation/pages/auth_page.dart';

initAuth() {
  AppRouter.appRouter
    .define(
      routePath: AuthPage.id,
      handler: AppRouteHandler(
        handlerFunc: (arguments) {
          return const AuthPage();
        },
      ),
    );
}