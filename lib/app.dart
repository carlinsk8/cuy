import 'package:cuy_test/feature/auth/presentation/pages/auth_page.dart';
import 'package:cuy_test/feature/plans/presentation/pages/plnas_page.dart';
import 'package:cuy_test/shared/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'di/injection_container.dart';
import 'feature/auth/presentation/providers/auth_provider.dart';
import 'generated/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<AuthProvider>(create: (_) => sl<AuthProvider>()),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        // home: const AuthPage(),
        home: const PlansPage(),
        //FF7A15
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