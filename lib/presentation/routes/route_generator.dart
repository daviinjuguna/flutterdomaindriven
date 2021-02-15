import 'package:enotes/presentation/notes/note_overview/note_overview_page.dart';
import 'package:enotes/presentation/sign_in/sign_in_page.dart';
import 'package:enotes/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => SignInPage());
      case '/note':
        return MaterialPageRoute(builder: (_) => NoteOverviewPage());
      case '/note_form':
        
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: FlatButton(
              onPressed: () =>
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
              child: Text("Exit"),
            ),
          ),
        );
      },
    );
  }
}