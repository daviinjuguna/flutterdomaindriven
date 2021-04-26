import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:enotes/domain/lang/language_facade.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'language_event.dart';
part 'language_state.dart';
part 'language_bloc.freezed.dart';

@injectable
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc({required LanguageFacade facade})
      : _facade = facade,
        super(LanguageState.initial());
  final LanguageFacade _facade;

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    yield* event.map(
      started: (e) async* {
        final lang = await _facade.fetchLocale();
        yield* lang.fold(
          (fail) async* {
            yield LanguageState.error("Error in language");
          },
          (success) async* {
            yield LanguageState.success(success);
          },
        );
      },
      change: (e) async* {
        final lang = await _facade.changeLanguage(type: e.locale);
        yield* lang.fold(
          (fail) async* {
            yield LanguageState.error("Error in language");
          },
          (success) async* {
            yield LanguageState.success(success);
          },
        );
      },
    );
  }
}
