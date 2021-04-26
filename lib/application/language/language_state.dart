part of 'language_bloc.dart';

@freezed
class LanguageState with _$LanguageState {
  const factory LanguageState.initial() = _Initial;
  const factory LanguageState.success(Locale locale) = _Success;
  const factory LanguageState.error(String message) = _Error;
}
