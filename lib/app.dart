import 'package:cuy_test/providers.dart';
import 'package:cuy_test/shared/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'feature/splash/presentation/pages/splash_page.dart';
import 'generated/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.list,
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const SplashPage(),
         theme: ThemeData(
            primaryColor: const Color(0xffFF7A15),
            colorScheme: ThemeData()
                .colorScheme
                .copyWith(primary: const Color(0xffFF7A15))
                .copyWith(secondary: const Color(0xff5E3380)),
            scaffoldBackgroundColor: Colors.grey.shade300,
            tabBarTheme: const TabBarTheme(
              labelColor: Color(0xffFF7A15),
              unselectedLabelColor: Colors.grey,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 0.0,
                  color: Colors.transparent,
                ),
              ),
            ),
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
          ),
        onGenerateRoute: (settings) => AppRouter.appRouter.matchRoute(
          settings.name!,
          routeSettings: settings,
        ),
      ),
    );
  }
}