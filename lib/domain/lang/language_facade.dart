import 'package:dartz/dartz.dart';
import 'package:enotes/domain/lang/language_failure.dart';
import 'package:flutter/material.dart';

abstract class LanguageFacade {
  Future<Either<LanguageFailure,Locale>> fetchLocale();
  Future<Either<LanguageFailure,Locale>> changeLanguage({
    @required Locale type,
  });
}