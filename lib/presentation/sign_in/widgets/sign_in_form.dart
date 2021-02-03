import 'package:enotes/app_localization.dart';
import 'package:enotes/application/auth/auth_bloc.dart';
import 'package:enotes/application/language/language_bloc.dart';
import 'package:enotes/application/sign_in/sign_in_bloc.dart';
import 'package:enotes/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flushbar/flushbar_helper.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  List<String> _language = [];
  String _lang;
  @override
  void initState() {
    _language.add("English");
    _language.add("Kiswahili");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              FlushbarHelper.createError(
                message: failure.map(
                  cancelledByUser: (_) =>
                      '${AppLocalizations.of(context).translate("cancelled")}',
                  serverError: (_) =>
                      '${AppLocalizations.of(context).translate("server_error")}',
                  emailAlreadyInUse: (_) =>
                      '${AppLocalizations.of(context).translate("email_in_use")}',
                  invalidEmailAndPasswordCombination: (_) =>
                      '${AppLocalizations.of(context).translate("inv_email_pass")}',
                ),
              ).show(context);
            },
            (_) {
              // ExtendedNavigator.of(context).replace(Routes.notesOverviewPage);
              context
                  .read<AuthBloc>()
                  .add(const AuthEvent.authCheckRequested());
            },
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: [
              const Text(
                '📝',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 130),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText:
                      '${AppLocalizations.of(context).translate("email")}',
                ),
                autocorrect: false,
                onChanged: (value) => context
                    .read<SignInBloc>()
                    .add(SignInEvent.emailChanged(value)),
                validator: (_) =>
                    context.read<SignInBloc>().state.emailAddress.value.fold(
                          (f) => f.maybeMap(
                            invalidEmail: (_) =>
                                '${AppLocalizations.of(context).translate("invalid_email")}',
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText:
                      '${AppLocalizations.of(context).translate("password")}',
                ),
                autocorrect: false,
                obscureText: true,
                onChanged: (value) => context
                    .read<SignInBloc>()
                    .add(SignInEvent.passwordChanged(value)),
                validator: (_) =>
                    context.read<SignInBloc>().state.password.value.fold(
                          (f) => f.maybeMap(
                            shortPassword: (_) =>
                                '${AppLocalizations.of(context).translate("invalid_password")}',
                            orElse: () => null,
                          ),
                          (_) => null,
                        ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        context.read<SignInBloc>().add(
                              const SignInEvent
                                  .signInWithEmailAndPasswordPressed(),
                            );
                      },
                      child: Text(
                          '${AppLocalizations.of(context).translate("login")}'),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        context.read<SignInBloc>().add(
                              const SignInEvent
                                  .registerWithEmailAndPasswordPressed(),
                            );
                      },
                      child: Text(
                          '${AppLocalizations.of(context).translate("register")}'),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () {
                  context
                      .read<SignInBloc>()
                      .add(const SignInEvent.signInWithGooglePressed());
                },
                color: Colors.lightBlue,
                child: Text(
                  '${AppLocalizations.of(context).translate("login_google")}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    // focusNode:  FocusNode(canRequestFocus: true),
                    elevation: 10,
                    dropdownColor: Colors.white,
                    value: _lang,
                    hint: Text(
                      AppLocalizations.of(context).translate("language"),
                      
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                    ),
                    items: _language
                        .map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Center(
                                child: new Text(
                                  value,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      setState(() {
                        _lang = value;
                      });

                      if (value == "English") {
                        context.read<LanguageBloc>().add(LanguageEvent.change(Locale("en")));
                        // BlocProvider.of<SplashBloc>(context)
                        //   ..add(ChangeLanguageEvent(type: Locale("en")));
                      } else {
                        context.read<LanguageBloc>().add(LanguageEvent.change(Locale("sw")));
                        // BlocProvider.of<SplashBloc>(context)
                        //   ..add(ChangeLanguageEvent(type: Locale("es")));
                      }
                    },
                  ),
                ),
              ),
              if (state.isSubmitting) ...[
                const SizedBox(height: 8),
                Center(child: const CircularProgressIndicator(value: null)),
              ]
            ],
          ),
        );
      },
    );
  }
}
