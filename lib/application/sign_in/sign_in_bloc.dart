import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:enotes/domain/auth/auth_facades.dart';
import 'package:enotes/domain/auth/auth_failure.dart';
import 'package:enotes/domain/auth/inputs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    @required AuthFacade facade,
  })  : _facade = facade,
        super(SignInState.initial());

  final AuthFacade _facade;

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    Stream<SignInState> _authenticate(
      Future<Either<AuthFailure, Unit>> Function({
        @required EmailAddress emailAddress,
        @required Password password,
      })
          forwardedCall,
    ) async* {
      Either<AuthFailure, Unit> failureOrSuccess;

      final isEmailValid = state.emailAddress.isValid();
      final isPasswordValid = state.password.isValid();

      if (isEmailValid && isPasswordValid) {
        yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        );

        failureOrSuccess = await forwardedCall(
          emailAddress: state.emailAddress,
          password: state.password,
        );
      }

      yield state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      );
    }

    yield* event.map(
      emailChanged: (e) async* {
        yield state.copyWith(
          emailAddress: EmailAddress(e.emailStr),
          authFailureOrSuccessOption: none(),
        );
      },
      passwordChanged: (e) async* {
        yield state.copyWith(
          password: Password(e.passwordStr),
          authFailureOrSuccessOption: none(),
        );
      },
      registerWithEmailAndPasswordPressed: (e) async* {
        yield* _authenticate(
          _facade.registerWithEmailAndPassword,
        );
      },
      signInWithEmailAndPasswordPressed: (e) async* {
        yield* _authenticate(_facade.signInWithEmailAndPassword);
      },
      signInWithGooglePressed: (e) async* {
        yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        );
        final failureOrSuccess = await _facade.signInWithGoogle();
        yield state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(failureOrSuccess),
        );
      },
    );
  }
}
