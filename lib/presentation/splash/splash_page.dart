import 'package:enotes/application/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) {
            print("Authenticated");
          },
              // ExtendedNavigator.of(context).replace(Routes.notesOverviewPage),
          unauthenticated: (_) =>Navigator.of(context).pushReplacementNamed('/login'),
              // ExtendedNavigator.of(context).replace(Routes.signInPage),
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}