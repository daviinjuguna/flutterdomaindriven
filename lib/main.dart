import 'package:enotes/app_localization.dart';
import 'package:enotes/application/core/my_bloc_observer.dart';
import 'package:enotes/application/language/language_bloc.dart';
import 'package:enotes/injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:injectable/injectable.dart';
import 'package:overlay_support/overlay_support.dart';

import 'application/auth/auth_bloc.dart';
import 'presentation/routes/route_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await configureInjection();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt.get<LanguageBloc>()..add(const LanguageEvent.started()),
        ),
        BlocProvider(
          create: (context) =>
              getIt.get<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        )
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          state.map(
            initial: (_) {},
            success: (e) {
              _locale = e.locale;
            },
            error: (e) {
              _locale = new Locale("en");
            },
          );
          return OverlaySupport(
            child: MaterialApp(
              locale: _locale,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                accentColor: Colors.blueAccent,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.blue[900],
                ),
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              supportedLocales: [
                Locale("en", "US"), //english
                Locale("sw", "TZ"), //swahili
              ],
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              onGenerateRoute: RouteGenerator.generateRoute,
              // home: MyHomePage(title: 'Flutter Demo Home Page'),
            ),
          );
        },
      ),
    );
  }
}
