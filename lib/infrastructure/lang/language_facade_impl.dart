import 'package:dartz/dartz.dart';
import 'dart:ui';

import 'package:enotes/domain/lang/language_facade.dart';
import 'package:enotes/domain/lang/language_failure.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: LanguageFacade)
class LanguageFacadeImpl implements LanguageFacade {
  final SharedPreferences _prefs;

  Locale _appLocale = Locale('en');
  LanguageFacadeImpl({required SharedPreferences prefs}) : _prefs = prefs;

  @override
  Future<Either<LanguageFailure, Locale>> changeLanguage(
      {required Locale type}) async {
    try {
      if (_appLocale == type) {
        return right(_appLocale);
      }
      if (type == Locale("sw")) {
        await _prefs.setString('language_code', 'sw');
        await _prefs.setString('countryCode', 'TZ');
        return right(_appLocale = Locale("sw"));
      } else {
        await _prefs.setString('language_code', 'en');
        await _prefs.setString('countryCode', 'US');
        return right(_appLocale = Locale("en"));
      }
    } catch (e) {
      print(e.toString());
      return left(LanguageFailure.serverError());
    }
  }

  @override
  Future<Either<LanguageFailure, Locale>> fetchLocale() async {
    try {
      if (_prefs.getString('language_code') == null) {
        _appLocale = Locale('en');
        return right(_appLocale);
      }
      _appLocale = Locale(_prefs.getString('language_code')!);
      return right(_appLocale);
    } catch (e) {
      print(e.toString());
      return left(LanguageFailure.serverError());
    }
  }
}
