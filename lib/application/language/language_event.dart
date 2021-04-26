part of 'language_bloc.dart';

@freezed
class LanguageEvent with _$LanguageEvent {
  const factory LanguageEvent.started() = _Started;
  const factory LanguageEvent.change(Locale locale) = _Change;
}
