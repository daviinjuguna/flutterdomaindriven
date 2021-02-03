import 'package:freezed_annotation/freezed_annotation.dart';
part 'language_failure.freezed.dart';
@freezed
abstract class LanguageFailure with _$LanguageFailure {
  const factory LanguageFailure.serverError() = _ServerError;
}