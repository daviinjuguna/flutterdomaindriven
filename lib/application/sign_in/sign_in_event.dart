part of 'sign_in_bloc.dart';

@freezed
abstract class SignInEvent with _$SignInEvent {
  const factory SignInEvent.emailChanged(String emailStr) = _EmailChanged;
  const factory SignInEvent.passwordChanged(String passwordStr) =
      _PasswordChanged;
  const factory SignInEvent.registerWithEmailAndPasswordPressed() =
      _RegisterWithEmailAndPasswordPressed;
  const factory SignInEvent.signInWithEmailAndPasswordPressed() =
      _SignInWithEmailAndPasswordPressed;
  const factory SignInEvent.signInWithGooglePressed() =
      _SignInWithGooglePressed;
}