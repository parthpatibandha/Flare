import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flare/core/localization/app_localization_delegate.dart';
import 'package:flare/core/style/app_theme.dart';
import 'package:flare/routes/app_route_delegates.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  // We're using HiveStore for persistence,
  // so we need to initialize Hive.
  await initHiveForFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AppTheme(themeLight))
    ], child: MaterialAppWithTheme());
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  MaterialAppWithTheme({super.key});

  final _routerDelegate = RoutesDelegator().routerDelegate;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppTheme>(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme,
      routerDelegate: _routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher:
          BeamerBackButtonDispatcher(delegate: _routerDelegate),
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
        Locale('ar', ''),
      ],
    );
  }
}
