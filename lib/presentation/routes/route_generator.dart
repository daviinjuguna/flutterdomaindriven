import 'package:enotes/presentation/notes/note_form/note_form_page.dart';
import 'package:enotes/presentation/notes/note_overview/note_overview_page.dart';
import 'package:enotes/presentation/routes/arguments_holder.dart';
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
        if (args is NoteFormArguments) {
          return MaterialPageRoute(
            builder: (_) => NoteFormPage(editedNote: args.editedNote),
          );
        }
        return _errorRoute();
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
            child: TextButton(
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
