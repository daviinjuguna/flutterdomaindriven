import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:enotes/domain/auth/auth_facades.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    @required AuthFacade facade,
  })  : _facade = facade,
        super(AuthState.initial());

  final AuthFacade _facade;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(
      authCheckRequested: (e) async* {
        final user = await _facade.getSignedInUser();
        yield user.fold(
          () => const AuthState.unauthenticated(),
          (user) => const AuthState.authenticated(),
        );
      },
      signedOut: (e) async* {
        await _facade.signOut();
        yield const AuthState.unauthenticated();
      },
    );
  }
}
