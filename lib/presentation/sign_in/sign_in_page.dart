import 'package:enotes/app_localization.dart';
import 'package:enotes/application/sign_in/sign_in_bloc.dart';
import 'package:enotes/injection.dart';
import 'package:enotes/presentation/sign_in/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${AppLocalizations.of(context).translate("sign_in")}'),
      ),
      body: BlocProvider(
        create: (context) => getIt<SignInBloc>(),
        child: SignInForm(),
      ),
    );
  }
}
